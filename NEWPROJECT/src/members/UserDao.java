package members;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;


//Database Acess object
public class UserDao {
	
	public Connection conn=null;
	public PreparedStatement pstmt=null;
	public ResultSet rs=null;
	
	public boolean loginCheck(String userID, String userPassword)
	{
		String SQL="SELECT * from members where userid=? and userpasswd=?";
		
		try
		{
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);		
			rs=pstmt.executeQuery();
			return rs.next();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
	public int join(String userID,String userPassword, String username,String usertelno,String userMailadd, String userBirth,String userGender)
	{
		String SQL="INSERT INTO members VALUES(?,?,?,?,?,?,?)";
		
		try
		{
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, username);
			pstmt.setString(4, usertelno);
			pstmt.setString(5, userMailadd);
			pstmt.setString(6, userBirth);
			pstmt.setString(7, userGender);
			return pstmt.executeUpdate();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;
	}
	
}
