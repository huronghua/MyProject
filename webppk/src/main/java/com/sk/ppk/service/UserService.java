package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Page;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.util.PageData;

public interface UserService {
	/**登录判断
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	User selectUserByUP(User user)throws Exception;

	/**件数取得
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	int selectCount(User user)throws Exception;
	
	/**插入用户
	 * @param pd
	 * @return
	 * @throws Exception
	 */
    void insertUser(User user)throws Exception;
	
	User selectByPrimaryKey(Integer id);
	
    //通过用户名查询用户记录
	List<User> selectUserByCondition(String keyword);
	
	Page selectUserPage(Integer pageNum, String url);
	
	void stopUser(Integer id);
	//检索用户
	List<User> listAllUser();
	
	/**查询所有用户
	 * @return
	 * @throws Exception
	 */
	public List<User> selectAllinfo(Map pagemap)throws Exception;
	
	/**件数取得
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	int selectUserCount(Map pagemap)throws Exception;
	
	/**数据更新
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKeySelective(User user)throws Exception;
	
	/**删除记录
	 * @return
	 * @throws Exception
	 */
    public void deleteByPrimaryKey(int id)throws Exception; 
    
	/**删除所有记录
	 * @return
	 * @throws Exception
	 */
    public void deleteAll()throws Exception; 
    
	/**验证用户唯一性
	 * @return
	 * @throws Exception
	 */
	List<User> validateUser(String username);
}
