package control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.ResponseBody;

import daoImpl.UserDaoImpl;
import dao.UserDao;
import mapper.UserMapper;
import mapper.NextMapper;
import model.Test;
import model.User;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import model.TransTest;
import model.Message;

@Controller
@RequestMapping("/userController")
public class UserController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private NextMapper nextMapper;

	ArrayList<Test> test = new ArrayList<Test>();
	Set<Test> set = new HashSet<Test>();
	Map<String, Test> map = new HashMap<String, Test>();

	/*
	 * public void setUserDaoImpl(UserDaoImpl userDaoImpl) { this.userDaoImpl =
	 * userDaoImpl; }
	 */
	@RequestMapping("/hello")
	public String hello(Model model) {
		String name = userMapper.getNameById(1);
		System.out.println(userMapper.queryAllUser().get(6).getName());// ������ġ��ɹ���
		// String name2 = nextMapper.getNameById(2);
		model.addAttribute("greeting", name);
		// model.addAttribute("name", name2);

		return "helloworld";

	}

	@RequestMapping(value="/next", method = RequestMethod.POST)
	  @ResponseBody
	public List<User> output(HttpServletRequest request, @RequestParam("jsonStr") String myDomain) {  
	   //TransTest tTest = new TransTest();
	   //User test = new User(1,"clg");
       //System.out.println(request.getParameterMap());
       String clientEncoding = request.getCharacterEncoding();
       System.out.println(clientEncoding);
       System.out.println(myDomain);
            
       JSONObject object=JSONObject.fromObject(myDomain);//������,@RequestBody String myDomain
       System.out.println(object.get("data")); 
       JSONArray  dataArray = object.getJSONArray("data");
       JSONObject  dataObject = (JSONObject) dataArray.get(0);
       int id = dataObject.getInt("id");
       String name =  dataObject.getString("name");
       System.out.println(id);
//      TransTest tTest =  (TransTest) object.get("data");
//      System.out.println(tTest);
       //System.out.println(datas[0].getId());//������@RequestParam(value="data[]") int[] datas��Ҳ������json�ַ������������
       //System.out.println(tTest.getData()[0]);//@RequestBody��֪��Ϊʲô����@RequestBody TransTest tTest
       //System.out.println(user.getId());
       return userMapper.queryAllUser();
         
    }

	
	@RequestMapping(value = "/getUserList", method = RequestMethod.POST)
	@ResponseBody
	public List<User> getUserList(Model model, HttpServletRequest request) {
		return userMapper.queryAllUser();

	}
	
	@RequestMapping("/test")
	@ResponseBody
	public String out(Model model) {
		return "clggggg";

	}

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	@ResponseBody
	public Message signUpAction(Model model, HttpServletRequest request) {
		List<User> userList = userMapper.queryAllUser();
		Message message = new Message();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		int i;
		for(i = 0;i < userList.size();i++){
			if(name.equals(userList.get(i).getName())){				
				message.setMsg("用户名已存在");			
				break;
			}
		}
		if(i == userList.size()){
			User user = new User();
			//int id = (int) (Math.random() * 100);
			//user.setId(id);
			user.setName(name);
			user.setPassword(password);
			user.setSex(sex);
			user.setPhone(phone);
			userMapper.insertUser(user);
			message.setMsg("ok");	
			message.setId(userMapper.getIdByName(name));
		}
		
		//User getUser = userMapper.getUser(123);
		// userMapper.deleteUser(0);
		//System.out.println(request.getParameter("name"));
		//System.out.println(request.getParameter("password"));
		//System.out.println(getUser.getName());// �ɹ����
		//System.out.println(getUser.getPassword());
		return message;

	}
	@RequestMapping(value = "/signIn", method = RequestMethod.POST)
	@ResponseBody
	public Message signInAction(Model model, HttpServletRequest request) {
		Message message = new Message();
		List<User> userList = userMapper.queryAllUser();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		String randomString = (String) request.getSession().getAttribute("randomString");
		int i;
		for(i = 0;i < userList.size();i++){
			if(name.equals(userList.get(i).getName())){
				if(password.equals(userList.get(i).getPassword())){
					if(code.equals(randomString) || code.equals(randomString.toLowerCase())){
						message.setMsg("ok");
					}
					else{
						message.setMsg("验证码不正确");
					}
				}
				else{
					message.setMsg("密码不正确");
				}
				break;
			}
		}
		if(i == userList.size()){
			message.setMsg("用户名不存在");
		}
		return message;

	}
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	@ResponseBody
	public Message updateUser(Model model, HttpServletRequest request) {
		Message message = new Message();
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		user.setSex(request.getParameter("sex"));
		user.setPhone(request.getParameter("phone"));
		try{
			userMapper.updateUser(user);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(Model model, HttpServletRequest request) {

		return "index";

	}
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteUser(Model model, HttpServletRequest request) {
		Message message = new Message();
		try{
			userMapper.deleteUser(Integer.parseInt(request.getParameter("id")));
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	@ResponseBody
	public String insertUser(Model model, HttpServletRequest request) {

		return "index";

	}
	@RequestMapping(value = "/loadPic", method = RequestMethod.GET)
	@ResponseBody
	public void loadPic(Model model, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

		 CaptchaUtil.outputCaptcha(request, response);

	}

}