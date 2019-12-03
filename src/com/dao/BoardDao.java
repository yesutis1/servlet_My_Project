package com.dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.websocket.Session;

import com.board.beans.Board;

public class BoardDao extends CommonDao {
    public static BoardDao getInstance() {
        BoardDao _instance = new BoardDao();
        return _instance;
    }

//    list1 게시글 불러오기
    public ArrayList<Board> getArticleList() throws SQLException {
        ResultSet rs = null;
//		인덱스 번호 재조정
//    	String line = "ALTER TABLE BOARD AUTO_INCREMENT=1;SET @COUNT = 0;UPDATE BOARD SET idx = @COUNT:=@COUNT+1 WHERE idx;";
//		openConnections().executeQuery(line);
		
//      테이블 가져오기  String sql = "select * from BOARD order by idx desc";
        String sql = "SELECT a.idx, a.title, b.user_id AS writer, a.fileName, a.reg_date, a.hit_count FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx ORDER BY a.idx;";
        rs = openConnections().executeQuery(sql);
        
        ArrayList<Board> articleList = new ArrayList<Board>();
        while (rs.next()) {
            Board article = new Board();

            article.setIdx(rs.getInt("idx"));
            article.setTitle(rs.getString("title"));
            article.setWriter(rs.getString("writer"));
            article.setFileName(rs.getString("fileName"));
            article.setRegdate(rs.getString("reg_date"));
            article.setHit_count(rs.getString("hit_count"));

            articleList.add(article);
        }
        closeConnections();    
        
        return articleList;
    }
    
//  list2 게시글 불러오기
    public ArrayList<Board> getArticleList2(int startNum, String category) throws SQLException {
    	ResultSet rs = null;
    	String sql2;
    	if(category.equals("all")) {
    		sql2 = "SELECT a.idx, a.category ,a.title, b.user_id AS writer,a.fileName, a.fileRealName, a.reg_date, a.hit_count, COUNT(c.num) AS comment"
    				+" FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx LEFT JOIN CONTENT AS c"
    				+" ON a.idx = c.num GROUP BY a.idx DESC LIMIT "+startNum+",10;";    		
    	}else {
    		sql2 = "SELECT a.idx, a.category ,a.title, b.user_id AS writer,a.fileName, a.fileRealName, a.reg_date, a.hit_count, COUNT(c.num) AS comment"
    				+" FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx LEFT JOIN CONTENT AS c"
    				+" ON a.idx = c.num WHERE category='"+category+"' GROUP BY a.idx DESC LIMIT "+startNum+",10;";
    	}
    	
        rs = openConnections().executeQuery(sql2);
        ArrayList<Board> articleList = new ArrayList<Board>();
        while (rs.next()) {
            Board article = new Board();
            
            article.setIdx(rs.getInt("idx"));
            article.setCategory(rs.getString("category"));
            article.setTitle(rs.getString("title"));
            article.setWriter(rs.getString("writer"));
            article.setFileName(rs.getString("fileName"));
            article.setFileRealName(rs.getString("fileRealName"));
            article.setRegdate(rs.getString("reg_date"));
            article.setHit_count(rs.getString("hit_count"));
            article.setCommentCount(rs.getInt("comment"));
            articleList.add(article);             
        }
        closeConnections();
        return articleList;
    }
    public int pageNum() throws SQLException {
    	 ResultSet rs = null;
//       게시글 수량 확인하기
         String sql = "SELECT COUNT(idx) AS count FROM BOARD;";
         rs = openConnections().executeQuery(sql);
         int count = 0;
         while(rs.next()) {
         	count = rs.getInt("count")/10 +1;        	
         }
         closeConnections();
         return count;
    }
    
//    ---------------------------------------------------------------------------------------
//     게시글 상세보기
    public ArrayList<Board> getArticleList(int idx) throws SQLException {
        ResultSet rs = null;
//        UPDATE my_site.BOARD set hit_count  = hit_count+1 where idx = 1;
        String sql = "UPDATE my_site.BOARD SET hit_count  = hit_count+1 WHERE idx = "+idx+";";
        rs = openConnections().executeQuery(sql);
        
        String sql2 = "SELECT a.idx, a.category, a.title, b.user_id AS writer, a.fileName, a.fileRealName, a.reg_date, a.content, a.hit_count FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx WHERE a.idx="+idx+";";
        rs = openConnections().executeQuery(sql2);
        
        ArrayList<Board> articleList = new ArrayList<Board>();
        while (rs.next()) {
            Board article = new Board();

            article.setIdx(rs.getInt("idx"));
            article.setCategory(rs.getString("category"));
            article.setTitle(rs.getString("title"));
            article.setWriter(rs.getString("writer"));
            article.setFileName(rs.getString("fileName"));
            article.setFileRealName(rs.getString("fileRealName"));
            article.setRegdate(rs.getString("reg_date"));
            article.setContent(rs.getString("content"));
            article.setHit_count(rs.getString("hit_count"));
            articleList.add(article);
        }
        closeConnections();
        return articleList;
    }
//    댓글 불러오기
    public ArrayList<Board> getArticleContent(int idx) throws SQLException {
    	ResultSet rs = null;      
    	String sql = "SELECT idx, user_id, text, reg_date FROM CONTENT WHERE num="+idx+";";
    	rs = openConnections().executeQuery(sql);
    	
    	ArrayList<Board> articleContent = new ArrayList<Board>();
    	while (rs.next()) {
    		Board article = new Board();
    		
    		article.setIdx(rs.getInt("idx"));
    		System.out.println(article.getIdx());
    		article.setWriter(rs.getString("user_id"));
    		System.out.println(article.getWriter());
    		article.setContent(rs.getString("text"));
    		article.setRegdate(rs.getString("reg_date"));
    		articleContent.add(article);
    	}
    	closeConnections();
    	return articleContent;
    }
    

//  ---------------------------------------------------------------------------------------
//    게시글 삭제
    public int deleteArticle(int idx, String id) throws SQLException, IOException {
    	ResultSet rs = null;
    	String user_id = "";
    	String fileName = "";
    	String sql = "SELECT b.user_id, a.fileRealName FROM BOARD AS a LEFT JOIN USER AS b ON a.user_id = b.idx WHERE a.idx="+idx+";";
    	rs = openConnections().executeQuery(sql);
    	while(rs.next()) {
    		user_id = rs.getString("user_id");    
    		fileName = rs.getString("fileRealName");
    	}
    	closeConnections();
    	
    	System.out.println("user_id = " + user_id);
    	System.out.println("fileName = " + fileName);
    	
    	if(fileName.equals(null)) {
    		Path path = Paths.get("C:\\Users\\YONSAI\\Desktop\\My\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\My_Project\\upload\\"+fileName);
    		Files.delete(path);
    		System.out.println("file delete");    		
    	}
    	if(user_id.equals(id)) {
	        String sql2 = "DELETE FROM BOARD WHERE idx="+idx+";";
	        openConnections().executeQuery(sql2);
	        return 0;
    	}else {
    		return 1;
    	}
    }
//    댓글 삭제
    public int deleteContentArticle(int contentIdx, String id) throws SQLException {
    	ResultSet rs = null;
    	String user_id = "";
    	String sql = "SELECT user_id FROM CONTENT WHERE idx="+contentIdx+";";
    	rs = openConnections().executeQuery(sql);
    	while(rs.next()) {
    		user_id = rs.getString("user_id");    		
    	}
    	closeConnections();
    	
    	if(user_id.equals(id)) {
    		String sql2 = "DELETE FROM CONTENT WHERE idx="+contentIdx+";";
    		openConnections().executeQuery(sql2);
	        return 0;
    	}else {
    		return 1;
    	}
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
    			+"(TITLE, category, hit_count, content,fileName,fileRealName, user_id) "
    			+"VALUES ('"+article.getTitle()+"','"+article.getCategory()+"','"+article.getCount()+"','"+article.getContent()+"','"+article.getFileName()+"','"+article.getFileRealName()+"','"+idx+"');";
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
    
//    게시글 수정
    public void modifyArticle(Board article) throws SQLException {
        String sql = "UPDATE BOARD SET "+
            "title = '"+article.getTitle()+
            "', category = '"+article.getCategory()+
            "', content = '"+article.getContent()+
            "', fileName = '"+article.getFileName()+
            "', fileRealName = '"+article.getFileRealName()+
            "' "+ "WHERE idx = "+article.getIdx();
        openConnections().executeQuery(sql);
    }
}
