package mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Orders;
import model.ServiceNum;
public interface OrdersMapper {	
	public Orders getOrders(int id);
	public List<Orders> queryAllOrders();
	public List<ServiceNum> getServiceNum();
	public List<Orders> getOrdersList(int user_id);
	public List<Orders> getOrdersListByShopId(int shop_id);
	public List<Orders> getSureOrdersList(@Param("user_id")int user_id,@Param("stat")String stat);
	public List<Orders> getOrdersListByName(@Param("shop_id")int shop_id,@Param("time")String time);
	public int getWaitNum(@Param("shop_id")int shop_id,@Param("nowTime")String nowTime,@Param("orderTime")String orderTime);
	public void insertOrders(Orders orders);
	public void updateOrders(Orders orders);
	public void deleteOrders(int id);
	public void updateStat(int id);
}
