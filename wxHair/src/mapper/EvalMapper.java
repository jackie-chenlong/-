package mapper;
import java.util.List;
import model.Evaluate;
import model.EvalCount;
public interface EvalMapper {
	public String getNameById(int id);
	public int getIdByName(String name);
	public Evaluate getShop(int id);
	public String[] getStylist(int shopId);
	public List<Evaluate> getEvalList(int shop_id);
	public List<EvalCount> getAllEvalCount();
	public void insertEval(Evaluate evaluate);
	public void updateShop(Evaluate evaluate);
	public void deleteShop(int id);
}
