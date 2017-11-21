package com.xmockinterview.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Author : LizheSun
 * Date : 21/11/2017
 * Time : 6:31 PM
 * Department : Data Service Platform
 * Copyright @ 2017 YRD.Co.Ltd. All rights reserved
 */


@RestController
public class UserController {

    @RequestMapping("/hello")
    public String hello() {
        return "hello,this is a springboot demo";
    }
}
