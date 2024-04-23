
-- ---------------------------- ERABILTZAILEAK ------------------------------------------------------------------------

#Admin erabiltzaile
create user 'admin'@'localhost' identified by 'haia';
grant all privileges on *.* to 'admin'@'localhost' with grant option;


#Departamentu buruko erabiltzaile
create user 'dept_burua'@'localhost' identified by 'haia';
grant all privileges on *.* to 'dept_burua'@'localhost' with grant option;


#Analista1 erabiltzaile
create user 'analista1'@'localhost' identified by 'haia';
grant all privileges on *.* to 'analista1'@'localhost' with grant option;


#Analista2 erabiltzaile
create user 'analista2'@'localhost' identified by 'haia';
grant all privileges on *.* to 'analista2'@'localhost' with grant option;


#Langilearen erabiltzailea
create user 'langilea'@'localhost' identified by 'haia';
grant all privileges on *.* to 'langilea'@'localhost' with grant option;


#Bezeroaren erabiltailea
create user 'bezeroa'@'localhost' identified by 'haia';
grant all privileges on *.* to 'bezeroa'@'localhost' with grant option;


-- --------------------------------------- ROLAK ETA BAIMENAK 	-----------------------------------------------------------------

#ROLAK SORTU:

create role db_admin;
grant all privileges on *.* to db_admin with grant option;
grant reload, process, show databases to db_admin;

create role db_dept_burua;

create role db_analista1;

create role db_analista2;

create role db_langilea;

create role db_bezeroa;


