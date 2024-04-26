
-- ---------------------------- ERABILTZAILEAK ------------------------------------------------------------------------

#Admin erabiltzaile
create user 'admin'@'localhost' identified by 'haia';
grant all privileges on *.* to 'admin'@'localhost' with grant option;

drop user'admin'@'localhost';

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
create role if not exists dbadmin, db_dept_burua, dbanalista1, dbanalista2, dblangilea, db_bezeroa;

#BAIMENAK EMAN:
-- repair table db_spoty5;

-- GRANT ALL PRIVILEGES ON db_spoty5.* TO dbadmin;
-- REPAIR TABLE mysql.tables_priv;

GRANT SELECT, UPDATE ON db_spoty5.bezeroa to db_dept_burua;
GRANT SELECT, UPDATE ON db_spoty5.erreprodukzioak to db_dept_burua;
GRANT SELECT, UPDATE ON db_spoty5.estatistikak to db_dept_burua;

GRANT SELECT ON db_spoty5.abestia to dbanalista1;
GRANT SELECT ON db_spoty5.audio to dbanalista1;
GRANT SELECT ON db_spoty5.erreprodukzioak to dbanalista1;
GRANT SELECT ON db_spoty5.estatistikak to dbanalista1;
GRANT SELECT ON db_spoty5.musikaria to dbanalista1;
GRANT SELECT ON db_spoty5.playlist to dbanalista1;
GRANT SELECT ON db_spoty5.podcast to dbanalista1;
GRANT SELECT ON db_spoty5.podcaster to dbanalista1;
GRANT SELECT ON db_spoty5.premium to dbanalista1;

GRANT SELECT ON db_spoty5.abestia to dbanalista2;
GRANT SELECT ON db_spoty5.audio to dbanalista2;
GRANT SELECT ON db_spoty5.erreprodukzioak to dbanalista2;
GRANT SELECT ON db_spoty5.estatistikak to dbanalista2;
GRANT SELECT ON db_spoty5.musikaria to dbanalista2;
GRANT SELECT ON db_spoty5.playlist to dbanalista2;
GRANT SELECT ON db_spoty5.podcast to dbanalista2;
GRANT SELECT ON db_spoty5.podcaster to dbanalista2;
GRANT SELECT ON db_spoty5.premium to dbanalista2;

GRANT SELECT ON db_spoty5.abestia to dblangilea;
GRANT SELECT ON db_spoty5.album to dblangilea;
GRANT SELECT ON db_spoty5.audio to dblangilea;
GRANT SELECT ON db_spoty5.erreprodukzioak to dblangilea;
GRANT SELECT ON db_spoty5.estatistikak to dblangilea;
GRANT SELECT ON db_spoty5.gustukoak to dblangilea;
GRANT SELECT, UPDATE ON db_spoty5.musikaria to dblangilea;
GRANT SELECT ON db_spoty5.podcast to dblangilea;
GRANT SELECT, UPDATE ON db_spoty5.podcaster to dblangilea;
GRANT SELECT, UPDATE ON db_spoty5.premium to dblangilea;

GRANT SELECT ON db_spoty5.abestia to db_bezeroa;
GRANT SELECT ON db_spoty5.album to db_bezeroa;
GRANT SELECT, INSERT ON db_spoty5.gustukoak to db_bezeroa;
GRANT SELECT ON db_spoty5.musikaria to db_bezeroa;
GRANT SELECT, INSERT ON db_spoty5.playlist to db_bezeroa;
GRANT SELECT ON db_spoty5.podcast to db_bezeroa;
GRANT SELECT ON db_spoty5.podcaster to db_bezeroa;

-- Analista erabiltzaileetako BAIMENAK:
GRANT baimen_berezia ON db_spoty5.hizkuntza TO 'analista1'@'localhost';

GRANT ALL PRIVILEGES ON db_spoty5.* to 'admin'@'localhost';