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
import mapper.EvalMapper;
import model.Test;
import model.Message;
import model.Orders;
import model.Shop;
import net.sf.json.JSONObject;
import net.sf.json.JSONArray;
import model.TransTest;
import model.User;
import model.EvalCount;
import model.Evaluate;

@Controller
@RequestMapping("/evalController")
public class EvalController {
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private NextMapper nextMapper;
	@Autowired
	private EvalMapper evalMapper;

	ArrayList<Test> test = new ArrayList<Test>();
	Set<Test> set = new HashSet<Test>();
	Map<String, Test> map = new HashMap<String, Test>();

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
	
	@RequestMapping(value = "/submitEval", method = RequestMethod.POST)
	@ResponseBody
	public Message submitOrders(Model model, HttpServletRequest request) {
		Message message = new Message();
		int shop_id = Integer.parseInt(request.getParameter("shopId"));
		String userName = request.getParameter("name");
		String text = request.getParameter("text");
		String time = request.getParameter("time");
		Evaluate evaluate = new Evaluate();
		evaluate.setShop_id(shop_id);
		evaluate.setText(text);
		evaluate.setUserName(userName);
		evaluate.setTime(time);
		try{
			evalMapper.insertEval(evaluate);
		}
		catch(Exception e){
			e.printStackTrace();
			message.setMsg(e.toString());
			return message;
		}
		message.setMsg("ok");
		return message;

	}


	
	@RequestMapping(value = "/getShopService", method = RequestMethod.POST)
	@ResponseBody
	public String getShopService(Model model, HttpServletRequest request) {
		
		return "index";

	}
	@RequestMapping(value = "/getEvalList", method = RequestMethod.POST)
	@ResponseBody
	public List<Evaluate> getEvalList(Model model, HttpServletRequest request) {
		
		return evalMapper.getEvalList(Integer.parseInt(request.getParameter("shopId")));

	}
	
	@RequestMapping(value = "/getAllEvalCount", method = RequestMethod.POST)
	@ResponseBody
	public List<EvalCount> getAllEvalCount(Model model, HttpServletRequest request) {
		List<EvalCount> evalCountList = evalMapper.getAllEvalCount();
		for(int i = 0;i < evalCountList.size();i++){
			 String name = shopMapper.getNameById(evalCountList.get(i).getShopId());
			 evalCountList.get(i).setShopName(name);
		}
		return evalCountList;

	}

}