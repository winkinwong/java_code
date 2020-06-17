package com.ucsmy.eaccount.manage.dao;

import com.ucsmy.core.dao.BasicDao;
import com.ucsmy.eaccount.manage.entity.ManageUserAccount;
import com.ucsmy.eaccount.manage.entity.ManageUserProfile;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ManageUserProfileDao extends BasicDao<ManageUserProfile> {
    List<ManageUserProfile> listByUserIds(@Param("users")List<ManageUserAccount> users);

    ManageUserProfile getUserProfileByUserName(String userName);

    List<ManageUserProfile> getLists();
}
