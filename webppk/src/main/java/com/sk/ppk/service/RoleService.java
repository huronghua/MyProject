package com.sk.ppk.service;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.RoleVo;
import com.sk.ppk.model.Styleinformation;

public interface RoleService {
	//列举出所有角色
	List<Role> listAllRole();
	
	List<RoleVo> listAllRoleVo();

	void stopRole(Integer id);
	
	List<Role> selectRoleByCondition(Integer roletype,String createuser);

	Integer selectRoleCount();
	
	Page selectRolePage(Integer pageNum, String url);
	
	/**查询所有角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> selectAllroleinfo(Map pagemap)throws Exception;
	
	/**件数取得
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	int selectCount(Map pagemap)throws Exception;
	
	/**角色插入
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void insertRole(Role role)throws Exception;
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
    Role selectByPrimaryKey(int id)throws Exception;
    
	/**保存角色
	 * @return
	 * @throws Exception
	 */
    public void saverole(Role role)throws Exception;
    
	/**更新数据
	 * @return
	 * @throws Exception
	 */
    public int updateByPrimaryKeySelective(Role record) throws Exception;
	int deleteByPrimaryKey(Integer id)throws Exception;
	/**删除所有书
	 * @return
	 * @throws Exception
	 */
    void deleteAllRole()throws Exception;
}
