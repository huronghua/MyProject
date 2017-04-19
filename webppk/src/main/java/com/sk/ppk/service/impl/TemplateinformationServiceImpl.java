package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.StyleinformationMapper;
import com.sk.ppk.dao.TemplateinformationMapper;
import com.sk.ppk.dao.UserMapper;
import com.sk.ppk.model.Templateinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.service.TemplateinformationService;

@Service("templateinformationService")
public class TemplateinformationServiceImpl implements TemplateinformationService {
	@Autowired
	private TemplateinformationMapper templateinformationDao;
	
	public void insert(Templateinformation templateinformation) throws Exception {
		templateinformationDao.insert(templateinformation);
	}
	
	public void insertSelective(Templateinformation templateinformation) throws Exception {
		templateinformationDao.insertSelective(templateinformation);
	}
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
    public Templateinformation selectByPrimaryKey(int id)throws Exception
    {
    	return templateinformationDao.selectByPrimaryKey(id);
    }
	
	public List<Templateinformation> getTemplate(Map pagemap) throws Exception {
		return (List<Templateinformation>) templateinformationDao.getTemplate(pagemap);
	}
	
	/**根据类型取得模板
	 * @return
	 * @throws Exception
	 */
	public List<Templateinformation> getTemplatebytype(Map pagemap) throws Exception {
		return (List<Templateinformation>) templateinformationDao.getTemplatebytype(pagemap);
	}
	
	public int getTemplateCount(Map pagemap) throws Exception {
		return templateinformationDao.getTemplateCount(pagemap);
	}
	
	/**根据键值更新
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKeySelective(Templateinformation templateinformation)throws Exception
	{
		templateinformationDao.updateByPrimaryKeySelective(templateinformation);
	}
	
	/**状态更新
	 * @return
	 * @throws Exception
	 */
	public void updateStatus(Templateinformation templateinformation)throws Exception
	{
		templateinformationDao.updateStatus(templateinformation);
	}
	
	/**删除记录
	 * @return
	 * @throws Exception
	 */
	public void deleteByPrimaryKey(int id)throws Exception
    {
    	templateinformationDao.deleteByPrimaryKey(id);
    }
}
