package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import com.board.beans.Board;

public class BoardDao extends CommonDao {
    public static BoardDao getInstance() {
        BoardDao _instance = new BoardDao();
        return _instance;
    }

    public ArrayList<Board> getArticleList() throws SQLException {
        ResultSet rs = null;
//		인덱스 번호 재조정
//    	String line = "ALTER TABLE BOARD AUTO_INCREMENT=1;SET @COUNT = 0;UPDATE BOARD SET idx = @COUNT:=@COUNT+1 WHERE idx;";
//		openConnections().executeQuery(line);
		
//      테이블 가져오기  String sql = "select * from BOARD order by idx desc";
        String sql = "SELECT a.idx, a.title, b.user_id AS writer, a.reg_date, a.hit_count FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx ORDER BY a.idx;";
        rs = openConnections().executeQuery(sql);
        
        ArrayList<Board> articleList = new ArrayList<Board>();
        while (rs.next()) {
            Board article = new Board();

            article.setIdx(rs.getInt("idx"));
            article.setTitle(rs.getString("title"));
            article.setWriter(rs.getString("writer"));
            article.setRegdate(rs.getString("reg_date"));
            article.setHit_count(rs.getString("hit_count"));

            articleList.add(article);
        }
        closeConnections();    
        
        return articleList;
    }
    
//    ---------------------------------------------------------------------------------------
//     게시글 상세보기
    public ArrayList<Board> getArticleList(int idx) throws SQLException {
        ResultSet rs = null;
//        UPDATE my_site.BOARD set hit_count  = hit_count+1 where idx = 1;
        String sql = "UPDATE my_site.BOARD SET hit_count  = hit_count+1 WHERE idx = "+idx+";";
        rs = openConnections().executeQuery(sql);
        
        String sql2 = "SELECT a.idx, a.title, b.user_name AS writer, a.reg_date, a.content, a.hit_count FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx WHERE a.idx="+idx+";";
        rs = openConnections().executeQuery(sql2);
        
        ArrayList<Board> articleList = new ArrayList<Board>();
        while (rs.next()) {
            Board article = new Board();

            article.setIdx(rs.getInt("idx"));
            article.setTitle(rs.getString("title"));
            article.setWriter(rs.getString("writer"));
            article.setRegdate(rs.getString("reg_date"));
            article.setContent(rs.getString("content"));
            article.setCount(rs.getInt("hit_count"));
            articleList.add(article);
        }
        closeConnections();
        return articleList;
    }
//    댓글 불러오기
    public ArrayList<Board> getArticleContent(int idx) throws SQLException {
    	ResultSet rs = null;      
    	String sql = "SELECT idx user_id, text, reg_date FROM CONTENT WHERE num="+idx+";";
    	rs = openConnections().executeQuery(sql);
    	
    	ArrayList<Board> articleContent = new ArrayList<Board>();
    	while (rs.next()) {
    		Board article = new Board();
    		
    		article.setWriter(rs.getString("user_id"));
    		article.setContent(rs.getString("text"));
    		article.setRegdate(rs.getString("reg_date"));
    		article.setIdx(rs.getInt("idx"));
    		articleContent.add(article);
    	}
    	closeConnections();
    	return articleContent;
    }
    

//  ---------------------------------------------------------------------------------------
//    게시글 삭제
    public void deleteArticle(int idx) throws SQLException {
        String sql = "DELETE FROM BOARD WHERE idx="+idx+";";
        openConnections().executeQuery(sql);
    }
//    댓글 삭제
    public void deleteContentArticle(int contentIdx) throws SQLException {
        String sql = "DELETE FROM CONTENT WHERE idx="+contentIdx+";";
        openConnections().executeQuery(sql);
    }

    
//  ---------------------------------------------------------------------------------------
//    게시글 작성
    public void insertArticle(Board article) throws SQLException {
    	ResultSet rs = null;
//    	로그인한 맴버 번호 가져오기
    	String sql =  "SELECT idx AS writer FROM USER AS b WHERE b.user_id='"+article.getWriter()+"';";
    	rs = openConnections().executeQuery(sql);
    	int idx = 0;
    	while (rs.next()) {
            idx = rs.getInt("idx");
        }
        closeConnections();
        
//    	게시글 작성
    	String sql2 = "INSERT INTO BOARD "
    			+"(TITLE, hit_count, content, user_id) "
    			+"VALUES ('"+article.getTitle()+"','"+article.getCount()+"','"+article.getContent()+"','"+idx+"');";
    	openConnections().executeQuery(sql2);
    }
    
//    덧글 작성
    public void insertArticleContent(Board article) throws SQLException {
//    	댓글 작성
    	String sql2 = "INSERT INTO CONTENT "
    			+"(user_id, text, num) "
    			+"VALUES ('"+article.getWriter()+"','"+article.getContent()+"','"+article.getIdx()+"');";
    	openConnections().executeQuery(sql2);
    }
    
}
