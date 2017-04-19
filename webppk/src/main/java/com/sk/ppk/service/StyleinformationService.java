package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Styleinformation;

public interface StyleinformationService
{
	
	/**������ʽ
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    void insertStyle(Styleinformation styleinformation)throws Exception;
    
	/**����ȡ��
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	int selectCount(Map pagemap)throws Exception;
	
	/**���м�¼ȡ��
	 * @return
	 * @throws Exception
	 */
	public List<Styleinformation> selectAllstyleinfo(Map pagemap)throws Exception;
	
	public String selectstylecontent(Map pagemap)throws Exception;
	/**样式列表取得
	 * @return
	 * @throws Exception
	 */
	public List<Styleinformation> selectAllstylelist()throws Exception;
	
	/**更新启用状态
	 * @return
	 * @throws Exception
	 */
    void updateByPrimaryKeySelective(Styleinformation styleinformation)throws Exception;
    
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
    Styleinformation selectByPrimaryKey(int id)throws Exception;
    
	/**删除数据
	 * @return
	 * @throws Exception
	 */
    void deleteByPrimaryKey(int id)throws Exception;
    
	/**删除所有书
	 * @return
	 * @throws Exception
	 */
    void deleteAllStyle()throws Exception;

	void updateSelectiveWithoutPath(Styleinformation styleinformation);
    
}
