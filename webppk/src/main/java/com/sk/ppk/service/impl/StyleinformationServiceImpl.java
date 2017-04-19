package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.StyleinformationMapper;
import com.sk.ppk.dao.UserMapper;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.service.StyleinformationService;
import com.sk.ppk.service.UserService;

@Service("styleinformationService")
public class StyleinformationServiceImpl implements StyleinformationService {
	@Autowired
	private StyleinformationMapper styleinformationDao;
	
	public void insertStyle(Styleinformation styleinformation) throws Exception {
		styleinformationDao.insertStyle(styleinformation);
	}
	/**����ȡ��
	 * @return
	 * @throws Exception
	 */
	public int selectCount(Map pagemap) throws Exception {
		return styleinformationDao.selectCount(pagemap);
	}
	
	/**������Ϣȡ��
	 * @return
	 * @throws Exception
	 */
	public List<Styleinformation> selectAllstyleinfo(Map pagemap)
	{
		return styleinformationDao.selectAllstyleinfo(pagemap);
	}
	
	/**样式列表取得
	 * @return
	 * @throws Exception
	 */
	public List<Styleinformation> selectAllstylelist()
	{
		return styleinformationDao.selectAllstylelist();
	}
	
	/**根据键值更新
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKeySelective(Styleinformation styleinformation) throws Exception {
		styleinformationDao.updateByPrimaryKeySelective(styleinformation);
	}
	
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
	public Styleinformation selectByPrimaryKey(int id) throws Exception
    {
    	return styleinformationDao.selectByPrimaryKey(id);
    }
	
	/**删除数据
	 * @return
	 * @throws Exception
	 */
	public void deleteByPrimaryKey(int id)throws Exception
    {
    	styleinformationDao.deleteByPrimaryKey(id);
    }
	
	/**删除所有数据
	 * @return
	 * @throws Exception
	 */
	public void deleteAllStyle() throws Exception
	{
    	styleinformationDao.deleteAllStyle();
	}
	
	public String selectstylecontent(Map pagemap)throws Exception
	{
		return styleinformationDao.selectstylecontent(pagemap);
	}
	@Override
	public void updateSelectiveWithoutPath(Styleinformation styleinformation) {
		styleinformationDao.updateSelectiveWithoutPath(styleinformation);
		
	}
}
