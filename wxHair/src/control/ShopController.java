package control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.ResponseBody;

import mapper.ShopMapper;
import mapper.NextMapper;
import model.Test;
import model.Message;
import model.Shop;
import model.ShopService;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import model.TransTest;
import model.User;

@Controller
@RequestMapping("/shopController")
public class ShopController {
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private NextMapper nextMapper;

	ArrayList<Test> test = new ArrayList<Test>();
	Set<Test> set = new HashSet<Test>();
	Map<String, Test> map = new HashMap<String, Test>();

	@RequestMapping("/hello")
	public String hello(Model model) {
		//String name = userMapper.getNameById(1);
		//System.out.println(userMapper.queryAllUser().get(6).getName());// ������ġ��ɹ���
		// String name2 = nextMapper.getNameById(2);
		//model.addAttribute("greeting", name);
		// model.addAttribute("name", name2);

		return "helloworld";

	}

//	@RequestMapping(value="/next", method = RequestMethod.POST)
//	  @ResponseBody
//	public List<User> output(HttpServletRequest request, @RequestParam("jsonStr") String myDomain) {  
//	   //TransTest tTest = new TransTest();
//	   //User test = new User(1,"clg");
//       //System.out.println(request.getParameterMap());
//       String clientEncoding = request.getCharacterEncoding();
//       System.out.println(clientEncoding);
//       System.out.println(myDomain);
//            
//       JSONObject object=JSONObject.fromObject(myDomain);//������,@RequestBody String myDomain
//       System.out.println(object.get("data")); 
//       JSONArray  dataArray = object.getJSONArray("data");
//       JSONObject  dataObject = (JSONObject) dataArray.get(0);
//       int id = dataObject.getInt("id");
//       String name =  dataObject.getString("name");
//       System.out.println(id);
////      TransTest tTest =  (TransTest) object.get("data");
////      System.out.println(tTest);
//       //System.out.println(datas[0].getId());//������@RequestParam(value="data[]") int[] datas��Ҳ������json�ַ������������
//       //System.out.println(tTest.getData()[0]);//@RequestBody��֪��Ϊʲô����@RequestBody TransTest tTest
//       //System.out.println(user.getId());
//       return userMapper.queryAllUser();
//         
//    }

	@RequestMapping("/test")
	@ResponseBody
	public String out(Model model) {
		return "clggggg";

	}

	@RequestMapping(value = "/getShopList", method = RequestMethod.POST)
	@ResponseBody
	public List<Shop> getShopList(Model model, HttpServletRequest request) {
		List<Shop> shopList = shopMapper.queryAllShop();
		return shopList;

	}
	@RequestMapping(value = "/getShopOrderList", method = RequestMethod.POST)
	@ResponseBody
	public List<Shop> getShopOrderList(Model model, HttpServletRequest request) {
		List<Shop> shopList = shopMapper.getShopOrderList();
		return shopList;

	}
	
	@RequestMapping(value = "/deleteShop", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteShop(Model model, HttpServletRequest request) {
		Message message = new Message();
		try{
			shopMapper.deleteShop(Integer.parseInt(request.getParameter("id")));
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	@RequestMapping(value = "/updateShop", method = RequestMethod.POST)
	@ResponseBody
	public Message updateUser(Model model, HttpServletRequest request) {
		Message message = new Message();
		Shop shop = new Shop();
		int shopId = Integer.parseInt(request.getParameter("id"));
		shop.setId(shopId);
		shop.setName(request.getParameter("name"));
		shop.setAddress(request.getParameter("address"));
		shop.setPassword(request.getParameter("password"));	
//		String stylist = request.getParameter("stylist");
//		String[] arr;
//		if(stylist != null){
//			//还需要先删除数据
//			int[] arrId = shopMapper.getStylistId(shopId);
//			for(int j = 0;j < arrId.length;j++){
//				shopMapper.deleteShopStylist(arrId[j]);
//			}
//			arr = stylist.split(",");
//			for(int j = 0;j < arr.length;j++){
//				shopMapper.insertShopStylist(shopId,arr[j]);
//			}
//		}
		try{
			shopMapper.updateShop(shop);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	@RequestMapping(value = "/addShop", method = RequestMethod.POST)
	@ResponseBody
	public Message addShop(Model model, HttpServletRequest request) {
		//List<User> userList = userMapper.queryAllUser();
		List<Shop> shopList = shopMapper.queryAllShop();
		Message message = new Message();
		String name = request.getParameter("name");
		int i;
		for(i = 0;i < shopList.size();i++){
			if(name.equals(shopList.get(i).getName())){				
				message.setMsg("商店名已存在");			
				break;
			}
		}
		if(i == shopList.size()){
			Shop shop = new Shop();
			String[] arr;
			//int id = (int) (Math.random() * 100);
			//user.setId(id);
			String address = request.getParameter("address");	
			String password = request.getParameter("password");	
			String stylist = request.getParameter("stylist");
			String serviceArr = request.getParameter("serviceArr");
			shop.setName(name);
			shop.setAddress(address);
			shop.setPassword(password);
			try{
				shopMapper.insertShop(shop);
			}
			catch(Exception e){
				e.printStackTrace();
				message.setMsg(e.toString());
				return message;
			}
			int shopId = shopMapper.getIdByName(name);
			message.setMsg("ok");				
		    message.setId(shopId);
			if(stylist != null){
				arr = stylist.split("[，,：.:;?]");
				for(int j = 0;j < arr.length;j++){
					//这里插入发型师和商店的关系
					shopMapper.insertShopStylist(shopId,arr[j]);		
				}
			}
			//增加服务数据
			if(serviceArr != null){
				JSONArray dataArray=JSONArray.fromObject(serviceArr);
				for(int j = 0;j < dataArray.size();j++){
					ShopService shopService = new ShopService();
					JSONObject obj = (JSONObject) dataArray.get(j);
					shopService.setShopId(shopId);
					shopService.setShopName(name);
					shopService.setService(obj.getString("service"));
					shopService.setPrice(obj.getString("price"));
					shopService.setNeedTime(obj.getString("needTime"));
					shopMapper.insertShopService(shopService);
				}
				

			}
		}
				
		return message;

	}
	
	
	@RequestMapping(value = "/shopSignIn", method = RequestMethod.POST)
	@ResponseBody
	public Message signInAction(Model model, HttpServletRequest request) {
		Message message = new Message();
		List<Shop> shopList = shopMapper.queryAllShop();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		String randomString = (String) request.getSession().getAttribute("randomString");
		int i;
		for(i = 0;i < shopList.size();i++){
			//还可以根据名字来查询数据库，有数据就代表有数据		
			if(name.equals(shopList.get(i).getName())){
				if(password.equals(shopList.get(i).getPassword())){
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
		if(i == shopList.size()){
			message.setMsg("商店名不存在");
		}
		return message;

	}
	@RequestMapping(value = "/getShop", method = RequestMethod.POST)
	@ResponseBody
	public Shop getShop(Model model, HttpServletRequest request) {
		return shopMapper.getShop(Integer.parseInt(request.getParameter("shopId")));

	}
	@RequestMapping(value = "/getShopByName", method = RequestMethod.POST)
	@ResponseBody
	public Shop getShopByName(Model model, HttpServletRequest request) {	
		int id = shopMapper.getIdByName(request.getParameter("name"));
		return shopMapper.getShop(id);
	}
	@RequestMapping(value = "/getStylist", method = RequestMethod.POST)
	@ResponseBody
	public String[] getStylist(Model model, HttpServletRequest request) {
		
		return shopMapper.getStylist(Integer.parseInt(request.getParameter("shopId")));

	}
	
	@RequestMapping(value = "/getService", method = RequestMethod.POST)
	@ResponseBody
	public List<ShopService> getService(Model model, HttpServletRequest request) {
		
		return shopMapper.getService(Integer.parseInt(request.getParameter("shopId")));

	}

}