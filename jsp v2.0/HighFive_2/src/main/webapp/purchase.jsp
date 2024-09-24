<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String filmId = request.getParameter("filmId");
   // String film_name = request.getParameter("film_name");
   String film_name = request.getParameter("filmName");

    String userId = (String) session.getAttribute("userId");
    System.out.println("Received filmId: " + filmId);
    System.out.println("Received film_name: " + film_name);

    // DB 연결 정보
    String jdbcDriver = "com.mysql.jdbc.Driver";
    String jdbcUrl = "jdbc:mysql://localhost:3306/test";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    response.setContentType("application/json");

    if (filmId != null && !filmId.trim().isEmpty()) {
        try {
            int id = Integer.parseInt(filmId);  // 숫자 변환 시도
            Class.forName(jdbcDriver);
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

            // 현재 구매 가능한 수량 가져오기
            String selectSql = "SELECT PURCHASE_QUANTITY FROM films WHERE ID = ?";
            pstmt = conn.prepareStatement(selectSql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int purchaseQuantity = rs.getInt("PURCHASE_QUANTITY");

                // 남은 수량이 1개 이상인 경우에만 구매 가능
                if (purchaseQuantity > 0) {
                    // 수량 감소 쿼리 실행
                    String updateSql = "UPDATE films SET PURCHASE_QUANTITY = PURCHASE_QUANTITY - 1 WHERE ID = ?";
                    pstmt = conn.prepareStatement(updateSql);
                    pstmt.setInt(1, id);
                    pstmt.executeUpdate();

                    // 구매 정보를 purchases 테이블에 삽입
                    String insertPurchaseSql = "INSERT INTO purchases (user_id, film_id, film_name) VALUES (?, ?, ?)";
                    PreparedStatement insertPstmt = conn.prepareStatement(insertPurchaseSql);
                    insertPstmt.setString(1, userId); // 세션에서 가져온 사용자 ID
                    insertPstmt.setInt(2, id);
                    insertPstmt.setString(3, film_name);
                    insertPstmt.executeUpdate(); 

                    // 트랜잭션 커밋
                    //conn.commit();

                    // 성공 응답 반환
                    response.getWriter().write("{\"success\": true}");
                } else {
                    // 수량이 부족한 경우
                    response.getWriter().write("{\"success\": false}");
                }
            } else {
                // 영화가 존재하지 않는 경우
                response.getWriter().write("{\"success\": false}");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"success\": false, \"error\": \"Invalid filmId\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false}");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    } else {
        response.getWriter().write("{\"success\": false, \"error\": \"filmId is required\"}");
    }
%>
