package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.DynamicinformationMapper;
import com.sk.ppk.model.Dynamicinformation;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.service.DynamicService;

@Service("dynamicService")
public class DynamicServiceImpl implements DynamicService {
	@Autowired
	private DynamicinformationMapper dynamicinformationDao;
	
	/**数据插入
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public int insert(Dynamicinformation record) throws Exception {
		return dynamicinformationDao.insert(record);
	}
	
	/**件数取得
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public int selectCount(Map pagemap)throws Exception {
		return dynamicinformationDao.selectCount(pagemap);
	}

	/**所有数据取得
	 * @return
	 * @throws Exception
	 */
	public List<Dynamicinformation> selectAlldynamicinfo(Map pagemap)
	{
		return dynamicinformationDao.selectAlldynamicinfo(pagemap);
	}
	
	/**所有数据取得
	 * @return
	 * @throws Exception
	 */
	public List<Dynamicinformation> selectAlldynamiclist(Map pagemap)
	{
		return dynamicinformationDao.selectAlldynamiclist(pagemap);
	}
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
	public Dynamicinformation selectByPrimaryKey(int id)throws Exception{
		return dynamicinformationDao.selectByPrimaryKey(id);
    }
	
	/**数据更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception
	{
		dynamicinformationDao.updateByPrimaryKey(dynamicinformation);
    }
	
	/**数据状态更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updatestatusByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception
	{
		dynamicinformationDao.updatestatusByPrimaryKey(dynamicinformation);
	}
	
	/**删除数据
	 * @return
	 * @throws Exception
	 */
    public int deleteByPrimaryKey(Integer id)throws Exception{
    	return dynamicinformationDao.deleteByPrimaryKey(id);
    }
}
