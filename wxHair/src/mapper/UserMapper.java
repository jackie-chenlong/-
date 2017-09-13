package mapper;
import java.util.List;
import model.User;
public interface UserMapper {
	public String getNameById(int id);
	public int getIdByName(String name);
	public User getUser(int id);
	public List<User> queryAllUser();
	public void insertUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
}
