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

import daoImpl.UserDaoImpl;
import dao.UserDao;
import mapper.UserMapper;
import mapper.NextMapper;
import mapper.OrdersMapper;
import mapper.ShopMapper;
import model.Test;
import model.User;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import model.TransTest;
import model.Message;
import model.Orders;
import model.Shop;
import model.ServiceNum;

@Controller
@RequestMapping("/ordersController")
public class OrdersController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private NextMapper nextMapper;

	ArrayList<Test> test = new ArrayList<Test>();
	Set<Test> set = new HashSet<Test>();
	Map<String, Test> map = new HashMap<String, Test>();
	

	@RequestMapping(value = "/submitOrders", method = RequestMethod.POST)
	@ResponseBody
	public Message submitOrders(Model model, HttpServletRequest request) {
		Message message = new Message();
		String userName = request.getParameter("userName");
		int userId = userMapper.getIdByName(userName);
		Orders orders = new Orders();
		orders.setUser_id(userId);
		orders.setShop_id(Integer.parseInt(request.getParameter("shopId")));
		orders.setService(request.getParameter("hairType"));
		orders.setPrice(request.getParameter("hairCost"));
		orders.setNeedTime(request.getParameter("hairTime"));
		orders.setStylist(request.getParameter("stylist"));		
		orders.setTime(request.getParameter("dateTime"));
		orders.setStat(request.getParameter("stat"));
		try{
			ordersMapper.insertOrders(orders);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}

	@RequestMapping(value = "/getOrdersList", method = RequestMethod.POST)
	@ResponseBody
	public List<Orders> getOrdersList(Model model, HttpServletRequest request) {
		String userName = request.getParameter("name");
		int userId = userMapper.getIdByName(userName);
		List<Orders> ordersList = ordersMapper.getOrdersList(userId);
		for(int i = 0;i < ordersList.size();i++){
			int shopId = ordersList.get(i).getShop_id();
			Shop shop = shopMapper.getShop(shopId);
			ordersList.get(i).setShopName(shop.getName());
			ordersList.get(i).setShopAddress(shop.getAddress());
		}
		return ordersList;

	}
	
	@RequestMapping(value = "/getSureOrdersList", method = RequestMethod.POST)
	@ResponseBody
	public List<Orders> getSureOrdersList(Model model, HttpServletRequest request) {
		String userName = request.getParameter("name");
		String stat = request.getParameter("stat");
		String nowTime = request.getParameter("nowTime");
		int userId = userMapper.getIdByName(userName);
		List<Orders> ordersList = ordersMapper.getSureOrdersList(userId,stat);
		for(int i = 0;i < ordersList.size();i++){
			int shopId = ordersList.get(i).getShop_id();
			int waitNum = ordersMapper.getWaitNum(shopId,nowTime,ordersList.get(i).getTime());
			Shop shop = shopMapper.getShop(shopId);
			ordersList.get(i).setWaitNum(waitNum);
			ordersList.get(i).setShopName(shop.getName());
			ordersList.get(i).setShopAddress(shop.getAddress());
		}
		return ordersList;

	}
	
	@RequestMapping(value = "/getOrdersListByShopId", method = RequestMethod.POST)
	@ResponseBody
	public List<Orders> getOrdersListByShopId(Model model, HttpServletRequest request) {
		String shopName = request.getParameter("name");
		String nowTime = request.getParameter("nowTime");
		int shopId = shopMapper.getIdByName(shopName);
		List<Orders> ordersList = ordersMapper.getOrdersListByShopId(shopId);
		for(int i = 0;i < ordersList.size();i++){
			int shop_id = ordersList.get(i).getShop_id();
			int waitNum = ordersMapper.getWaitNum(shop_id,nowTime,ordersList.get(i).getTime());
			int userId = ordersList.get(i).getUser_id();
			String userName = userMapper.getNameById(userId);
			ordersList.get(i).setUserName(userName);
			Shop shop = shopMapper.getShop(shop_id);
			ordersList.get(i).setWaitNum(waitNum);
			ordersList.get(i).setShopName(shop.getName());
			ordersList.get(i).setShopAddress(shop.getAddress());
		}
		return ordersList;

	}
	
	@RequestMapping(value = "/getOrdersListByName", method = RequestMethod.POST)
	@ResponseBody
	public List<Orders> getOrdersListByName(Model model, HttpServletRequest request) {
		String shopName = request.getParameter("searchText");
		String time = request.getParameter("time");
		int shop_id = shopMapper.getIdByName(shopName);
		List<Orders> ordersList = ordersMapper.getOrdersListByName(shop_id,time);
		for(int i = 0;i < ordersList.size();i++){
			int shopId = ordersList.get(i).getShop_id();
			int userId = ordersList.get(i).getUser_id();
			String userName = userMapper.getNameById(userId);
			ordersList.get(i).setUserName(userName);
			Shop shop = shopMapper.getShop(shopId);
			ordersList.get(i).setShopName(shop.getName());
			ordersList.get(i).setShopAddress(shop.getAddress());
		}
		return ordersList;

	}
	
	@RequestMapping(value = "/getAllOrders", method = RequestMethod.POST)
	@ResponseBody
	public List<Orders> getAllOrders(Model model, HttpServletRequest request) {

		List<Orders> ordersList = ordersMapper.queryAllOrders();	
		return ordersList;

	}
	
	@RequestMapping(value = "/getServiceNum", method = RequestMethod.POST)
	@ResponseBody
	public List<ServiceNum> getServiceNum(Model model, HttpServletRequest request) {

		List<ServiceNum> serviceList = ordersMapper.getServiceNum();	
		return serviceList;

	}
	
	@RequestMapping(value = "/deleteOrders", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteOrders(Model model, HttpServletRequest request) {
		Message message = new Message();
		int id = Integer.parseInt(request.getParameter("id"));
		try{
			ordersMapper.deleteOrders(id);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	
	@RequestMapping(value = "/ensureOrders", method = RequestMethod.POST)
	@ResponseBody
	public Message ensureOrders(Model model, HttpServletRequest request) {
		Message message = new Message();
		int id = Integer.parseInt(request.getParameter("id"));
		try{
			ordersMapper.updateStat(id);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}
	
	

}