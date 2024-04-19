# 4.erronkako datu basea

-- ------- drop database db_spoty5;

Create database db_spoty5 Collate utf8_general_ci;

use db_spoty5;

-- ---------------------------------------------------TAULAK SORTZEA---------------------------------------------------

Create table MUSIKARIA(
id_musikaria int auto_increment primary key,
izenArtistikoa varchar(30) unique not null,
irudia blob,
ezaugarria enum('bakarlaria', 'taldea'),
deskribapena varchar(80) not null
);

Create table PODCASTER(
id_podcaster int auto_increment not null primary key,
izenArtistikoa varchar(30) unique not null,
irudia blob,
deskribapena varchar(110) not null
);

Create table AUDIO(
id_audio int auto_increment not null primary key,
izena varchar(20) not null,
iraupena time not null,
irudia blob,
mota enum('podcast', 'abestia')
);

Create table HIZKUNTZA(
id_hizkuntza enum('ES', 'EU', 'EN', 'FR', 'DE', 'CA', 'GA', 'AR') primary key,
deskribapena varchar(30) not null
);

Create table PODCAST(
id_audio int auto_increment not null,
kolaboratzaileak varchar(40), 
id_podcaster int not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_podcaster) references podcaster (id_podcaster)
);

Create table ALBUM(
id_album int auto_increment not null,
izenburua varchar(20) not null,
urtea date not null,
generoa varchar(20) not null,
id_musikaria int,
PRIMARY KEY (id_album),
FOREIGN KEY (id_musikaria) references musikaria (id_musikaria) on delete set null on update cascade
);

Create table ABESTIA(
id_audio int not null,
id_album int not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_album) references album (id_album) on delete cascade on update cascade
);

Create table BEZEROA(
id_bezeroa int auto_increment,
izena varchar(10) not null,
abizena varchar(10) not null,
id_hizkuntza enum('ES', 'EU', 'EN', 'FR', 'DE', 'CA', 'GA', 'AR'),
erabiltzailea varchar(15) not null unique,
pasahitza varchar(10) not null,
jaiotze_data date not null,
erregistro_data date not null,
mota enum('free', 'premium') not null,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_hizkuntza) references hizkuntza (id_hizkuntza) on delete set null on update cascade
);

Create table PREMIUM(
id_bezeroa int not null,
iraungitze_data date not null,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade
);

Create table GUSTUKOAK(
id_bezeroa int not null,
id_audio int not null unique,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade,
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade
);

Create table ERREPRODUKZIOAK(
id int auto_increment primary key,
id_bezeroa int,
id_audio int not null,
erreprodukzio_data date not null,
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete set null on update cascade,
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade
);

Create table ESTATISTIKAK(
id_audio int not null,
erreprodukzio_total smallint not null,
gehien_gustoko smallint not null,
iruzkinak smallint not null,
deskargak smallint not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade
);

Create table PLAYLIST(
id_list smallint not null,
izenburua varchar(20) not null,
sorrera_data date not null,
id_bezeroa int not null,
PRIMARY KEY (id_list),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade
);

Create table PLAYLIST_ABESTIAK(
id_audio int not null,
id_list smallint not null,
PRIMARY KEY (id_audio, id_list),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_list) references playlist (id_list) on delete cascade on update cascade
);

