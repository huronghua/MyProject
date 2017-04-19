package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Page;
import com.sk.ppk.model.Styleinformation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.UserMapper;
import com.sk.ppk.model.User;
import com.sk.ppk.service.UserService;
import com.sk.ppk.util.PageData;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userDao;
	
	public User selectUserByUP(User user) throws Exception {
		return userDao.selectUserByUP(user);
	}
	
	public int selectCount(User user) throws Exception {
		return userDao.selectCount(user);
	}
	
	public User selectByPrimaryKey(Integer id) {
		return userDao.selectByPrimaryKey(id);
	}

	public void insertUser(User user) throws Exception {
		userDao.insertSelective(user);
	}
	
	public UserMapper getUserDao()
	{
		return userDao;
	}

	public void setUserDao(UserMapper userDao)
	{
		this.userDao = userDao;
	}
	
	public List<User> selectUserByCondition(String keyword) {
		return userDao.selectUserByCondition(keyword);
	}
	
	public Page selectUserPage(Integer pageNum, String url) {
		if(pageNum == null){
			pageNum = 1;
		}
		Page page = new Page(pageNum, userDao.selectUserCount());
		List<User> list = userDao.selectUserPage(page);
		page.setList(list);
		page.setUrl(url);
		return page;
	}
	
	public void stopUser(Integer id) {
		userDao.stopUser(id);
	}
	
	public List<User> listAllUser() {
		return userDao.listAllUser();
	}

	/**查询所有用户
	 * @return
	 * @throws Exception
	 */
	public List<User> selectAllinfo(Map pagemap)
	{
		return userDao.selectAllinfo(pagemap);
	}
	
	/**件数取得
	 * @return
	 * @throws Exception
	 */
	public int selectUserCount(Map pagemap) throws Exception {
		return userDao.selectUserCount(pagemap);
	}
	
	/**数据更新
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKeySelective(User user)throws Exception
	{
		userDao.updateByPrimaryKeySelective(user);
	}
	
	/**删除记录
	 * @return
	 * @throws Exception
	 */
	public void deleteByPrimaryKey(int id)throws Exception
    {
		userDao.deleteByPrimaryKey(id);
    }
	
	/**删除所有记录
	 * @return
	 * @throws Exception
	 */
	public void deleteAll()throws Exception
    {
		userDao.deleteAll();
    }

	@Override
	public List<User> validateUser(String username) {
		return userDao.validateUser(username);
	}
}
