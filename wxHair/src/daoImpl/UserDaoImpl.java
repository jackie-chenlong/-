package daoImpl;
import dao.UserDao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component; 

@Component
public class UserDaoImpl implements UserDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserDaoImpl(){
		
	}
	
	 public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {  
	        this.jdbcTemplate = jdbcTemplate;  
	 }  
	public String getNamebyId(int custId){
		
		String sql = "SELECT NAME FROM tcommodity WHERE id = ?";
			 
		String name = (String)jdbcTemplate.queryForObject(
				sql, new Object[] { custId }, String.class);
		
		return name;
			
	}
}
