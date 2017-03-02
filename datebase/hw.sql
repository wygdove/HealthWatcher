use healthwatcher;
SET FOREIGN_KEY_CHECKS=0;


DROP TABLE IF EXISTS hw_user;
CREATE TABLE hw_user (
  user_id int(10) NOT NULL AUTO_INCREMENT,
  login_account varchar(255) DEFAULT NULL,
  display_name varchar(30) DEFAULT NULL,
  account_type varchar(10) DEFAULT NULL,
  password varchar(60) DEFAULT NULL,
  status varchar(10) DEFAULT NULL,
  city_code varchar(30) DEFAULT NULL,
  city_name varchar(30) DEFAULT NULL,
  created_at datetime DEFAULT NULL,
  updated_at datetime DEFAULT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--account_type : admin user
--status : enable disable

insert into hw_user values(1,'wygdove','wygdove','admin','123123','enable','101010100','北京',now(),now());
insert into hw_user values(2,'test','test','user','123123','enable','101010100','北京',now(),now());
