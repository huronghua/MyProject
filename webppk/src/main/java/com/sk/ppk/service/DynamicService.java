package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Dynamicinformation;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.Styleinformation;

public interface DynamicService
{
	/**插入数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    int insert(Dynamicinformation record)throws Exception;
    
	/**件数取得
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	int selectCount(Map pagemap)throws Exception;
	
	/**数据取得
	 * @return
	 * @throws Exception
	 */
	public List<Dynamicinformation> selectAlldynamicinfo(Map pagemap)throws Exception;
	
	/**数据取得
	 * @return
	 * @throws Exception
	 */
	public List<Dynamicinformation> selectAlldynamiclist(Map pagemap)throws Exception;
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
	Dynamicinformation selectByPrimaryKey(int id)throws Exception;
	
	/**更新数据
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception;
	
	/**更新状态数据
	 * @return
	 * @throws Exception
	 */
	public void updatestatusByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception;
	
	public int deleteByPrimaryKey(Integer id)throws Exception;
}
