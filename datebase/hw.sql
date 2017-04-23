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
	user_avatar varchar(255) DEFAULT NULL,
	PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- account_type : admin user
-- status : enable disable

insert into hw_user values(1,'wygdove','wygdove','admin','123123','enable','101010100','北京',now(),now(),'defaultavator.jpg');
insert into hw_user values(2,'test','test','user','123123','enable','101010100','北京',now(),now(),'defaultavator.jpg');



DROP TABLE IF EXISTS hw_device_type;
CREATE TABLE hw_device_type (
	device_type_id int(10) NOT NULL AUTO_INCREMENT,
	device_type varchar(255) DEFAULT NULL,
	isvalid boolean DEFAULT TRUE,
	PRIMARY KEY (device_type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into hw_device_type values(1,'bodytemperature',TRUE);
insert into hw_device_type values(2,'pulse',TRUE);
insert into hw_device_type values(3,'breathe',TRUE);
insert into hw_device_type values(4,'bloodoxygen',TRUE);
insert into hw_device_type values(5,'ecg',TRUE);
insert into hw_device_type values(6,'pm25i',TRUE);
insert into hw_device_type values(7,'pm25o',TRUE);
insert into hw_device_type values(8,'wenshidu',TRUE);
insert into hw_device_type values(9,'light',FALSE);
insert into hw_device_type values(10,'camera',TRUE);



DROP TABLE IF EXISTS hw_device;
CREATE TABLE hw_device (
	device_id int(10) NOT NULL AUTO_INCREMENT,
	dname varchar(255) DEFAULT NULL,
	dflag varchar(30) DEFAULT NULL,
	dtype int(10) DEFAULT NULL,
	isdefault boolean DEFAULT FALSE,
	user_id int(10) DEFAULT NULL,
	PRIMARY KEY (device_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into hw_device values(1,'体温传感器1','111',1,TRUE,2);
insert into hw_device values(2,'脉搏传感器1','222',2,TRUE,2);
insert into hw_device values(3,'呼吸传感器1','333',3,TRUE,2);
insert into hw_device values(4,'血氧传感器1','444',4,TRUE,2);
insert into hw_device values(5,'心电传感器1','555',5,TRUE,2);
insert into hw_device values(6,'室内PM2.5传感器1','666',6,TRUE,2);
insert into hw_device values(7,'室外PM2.5传感器1','777',7,TRUE,2);
insert into hw_device values(8,'温湿度传感器1','888',8,TRUE,2);
-- insert into hw_device values(9,'光照传感器1','999',9,TRUE,2);
insert into hw_device values(10,'摄像头1','HSL-231513-VNZUZ',9,TRUE,2);

