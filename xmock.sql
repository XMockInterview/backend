CREATE TABLE `xmock`.`xmock_user_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `realname` VARCHAR(45) NULL COMMENT '真实名字',
  `nickname` VARCHAR(45) NULL COMMENT '别名',
  `email` VARCHAR(200) NULL COMMENT '邮件地址',
  `mobile` INT(11) NULL COMMENT '手机',
  `sex` VARCHAR(45) NULL COMMENT '性别',
  `country` VARCHAR(45) NULL COMMENT '国家',
  `city` VARCHAR(45) NULL COMMENT '城市',
  `area` VARCHAR(255) NULL COMMENT '区域',
  `address` VARCHAR(500) NULL COMMENT '详细地址',
  `company` VARCHAR(255) NULL COMMENT '目前公司',
  `position` VARCHAR(255) NULL COMMENT '职位',
  `skillskeywords` VARCHAR(500) NULL DEFAULT '' COMMENT '技能关键词',
  `resume` VARCHAR(2000) NULL DEFAULT '' COMMENT '简历',
  `createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));

CREATE TABLE `xmock`.`xmock_goods` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` VARCHAR(45) NOT NULL COMMENT '商品名字',
  `type` VARCHAR(45) NOT NULL COMMENT '商品类型',
  `statuts` INT NOT NULL DEFAULT 0 COMMENT '商品状态',
  `amount_vip` DECIMAL(10,3) NULL DEFAULT 0 COMMENT '商品金额_vip',
  `amount` DECIMAL(10,3) NULL DEFAULT 0 COMMENT '商品金额',
  `createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shortdesc` VARCHAR(45) NULL DEFAULT '' COMMENT '描述1',
  `fulldesc` VARCHAR(255) NULL DEFAULT '' COMMENT '描述2',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));



CREATE TABLE `xmock`.`xmock_user_auths` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` INT(11) NOT NULL,
  `identity_type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'phone,email,weibo,qq',
  `identifier` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'email,phone,weiboid,webchatid',
  `credential` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'password,accesstocken',
  `createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetimie` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `auths_foreign_key_uid`
    FOREIGN KEY (`uid`)
    REFERENCES `xmock`.`xmock_user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `xmock`.`xmock_accounts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `uid` INT(11) NOT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT 'interviewee or  interviewer',
  `createtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL COMMENT '状态',
  `desc` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '描述',
  `balance` DECIMAL(10,3) NOT NULL DEFAULT 0 COMMENT '余额',
  INDEX `xmock_accounts_uid_idx` (`uid` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `xmock_accounts_uid`
    FOREIGN KEY (`uid`)
    REFERENCES `xmock`.`xmock_user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `xmock`.`xmock_order_info` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键订单id',
  `accountid` INT NOT NULL COMMENT '账号id',
  `goodsid` INT NOT NULL COMMENT '商品id',
  `status` VARCHAR(45) NULL COMMENT '商品状态',
  `createtime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` VARCHAR(45) NULL COMMENT '订单类型',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `order_accounts_id_idx` (`accountid` ASC),
  INDEX `order_goods_id_idx` (`goodsid` ASC),
  CONSTRAINT `order_accounts_id`
    FOREIGN KEY (`accountid`)
    REFERENCES `xmock`.`xmock_accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `order_goods_id`
    FOREIGN KEY (`goodsid`)
    REFERENCES `xmock`.`xmock_goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
