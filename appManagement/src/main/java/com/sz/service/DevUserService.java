package com.sz.service;

import com.sz.pojo.DevUser;
import org.springframework.stereotype.Service;


@Service("devUserService")
public interface DevUserService {
     DevUser login(DevUser devUser);
}
