package mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.Shop;
import model.ShopService;
public interface ShopMapper {
	public String getNameById(int id);
	public int getIdByName(String name);
	public Shop getShop(int id);
	public String[] getStylist(int shopId);
	public int[] getStylistId(int shopId);
	public List<Shop> getShopOrderList();
	public List<Shop> queryAllShop();
	public List<ShopService> getService(int shopId);
	public void insertShop(Shop shop);
	public void insertShopService(ShopService shopService);
	public void insertShopStylist(@Param("shopId")int shopId,@Param("stylist")String stylist);
	public void updateShop(Shop shop);
	public void deleteShop(int id);
	public void deleteShopStylist(int id);
}
