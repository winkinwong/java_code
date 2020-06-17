package com.ucsmy.eaccount.manage.service;

import com.ucsmy.core.service.BasicService;
import com.ucsmy.eaccount.manage.entity.ManageUserAccount;
import com.ucsmy.eaccount.manage.entity.ManageUserProfile;

import java.util.List;

public interface ManageUserProfileService extends BasicService<ManageUserProfile> {

    List<ManageUserProfile> listByUserIds(List<ManageUserAccount> users);

    ManageUserProfile getUserProfileByUserName(String userName);


    List<ManageUserProfile> getLists();

}
