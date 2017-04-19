package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.Templateinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.util.PageData;

public interface TemplateinformationService
{
	/**插入用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    void insert(Templateinformation templateinformation)throws Exception;
    
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
    public Templateinformation selectByPrimaryKey(int id)throws Exception;
    
    void insertSelective(Templateinformation templateinformation)throws Exception;
    
    public List<Templateinformation> getTemplate(Map pagemap) throws Exception;
    
	/**根据类型取得模板
	 * @return
	 * @throws Exception
	 */
    public List<Templateinformation> getTemplatebytype(Map pagemap) throws Exception;
    
    public int getTemplateCount(Map pagemap) throws Exception;
    
    public void updateByPrimaryKeySelective(Templateinformation templateinformation)throws Exception;
    
    public void updateStatus(Templateinformation templateinformation)throws Exception;
    
	/**删除记录
	 * @return
	 * @throws Exception
	 */
    public void deleteByPrimaryKey(int id)throws Exception; 
    
}
