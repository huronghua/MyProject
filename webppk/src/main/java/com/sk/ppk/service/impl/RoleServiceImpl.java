package com.sk.ppk.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sk.ppk.dao.RoleMapper;
import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.RoleVo;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;
import com.sk.ppk.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleDao;

	public RoleMapper getRoleMapper() {
		return roleDao;
	}

	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleDao = roleMapper;
	}

	public List<Role> listAllRole() {
		List<Role> list = roleDao.listAllRole();
		return list;
	}
	
	public List<RoleVo> listAllRoleVo(){
		List<Role> list = roleDao.listAllRole();
		for(Role r : list){
			Integer roleId = r.getId();
		}
		return null;
	}

	public void stopRole(Integer id) {
		roleDao.stopRole(id);//此处一定要写不然service找不到mapper
	}
	
	public List<Role> selectRoleByCondition(Integer roletype,String createuser) {
		Role role = new Role();
		role.setRoletype(roletype);
		role.setCreateuser(createuser);
		return roleDao.selectRoleByCondition(role);
	}

	public Integer selectRoleCount() {
		return roleDao.selectRoleCount();
	}

	public Page selectRolePage(Integer pageNum, String url) {
		if(pageNum == null){
			pageNum = 1;
		}
		Page page = new Page(pageNum, roleDao.selectRoleCount());
		List<Role> list = roleDao.selectRolePage(page);
		page.setList(list);
		page.setUrl(url);
		return page;
	}
	
	/**查询所有用户��
	 * @return
	 * @throws Exception
	 */
	public List<Role> selectAllroleinfo(Map pagemap)
	{
		return roleDao.selectAllroleinfo(pagemap);
	}
	
	/**查询所有用户
	 * @return
	 * @throws Exception
	 */
	public int selectCount(Map pagemap) throws Exception {
		return roleDao.selectCount(pagemap);
	}
	
	/**插入角色
	 * @return
	 * @throws Exception
	 */
	public void insertRole(Role role)throws Exception{
		roleDao.insertRole(role);
	}
	
	/**根据键值查询
	 * @return
	 * @throws Exception
	 */
	public Role selectByPrimaryKey(int id)throws Exception{
		return roleDao.selectByPrimaryKey(id);
    }
	
	/**保存数据
	 * @return
	 * @throws Exception
	 */
	public void saverole(Role role)throws Exception{
		roleDao.saverole(role);
	}
	
	/**保存数据
	 * @return
	 * @throws Exception
	 */
    public int updateByPrimaryKeySelective(Role role)throws Exception{
        return roleDao.updateByPrimaryKeySelective(role);
    }
    
	/**删除数据
	 * @return
	 * @throws Exception
	 */
    public int deleteByPrimaryKey(Integer id)throws Exception{
    	return roleDao.deleteByPrimaryKey(id);
    }
    
	/**删除所有数据
	 * @return
	 * @throws Exception
	 */
	public void deleteAllRole() throws Exception
	{
		roleDao.deleteAllRole();
	}
}
