# 4.taldearen datu basea

-- -------drop database db_spoty5;

Create database db_spoty5;

use db_spoty5;

-- ---------------------------------------------------TAULAK SORTZEA---------------------------------------------------

Create table MUSIKARIA(
id_musikaria varchar(5) not null primary key,
izenArtistikoa varchar(30) unique not null,
irudia blob,
ezaugarria enum('bakarlaria', 'taldea') unique,
deskribapena varchar(80) not null
);

Create table PODCASTER(
id_podcaster varchar(5) not null primary key,
izenArtistikoa varchar(30) unique not null,
irudia blob,
deskribapena varchar(110) not null
);

Create table AUDIO(
id_audio smallint not null primary key,
izena varchar(20) not null,
iraupena time not null,
irudia blob,
mota enum('podcast', 'abestia') unique
);

Create table HIZKUNTZA(
id_hizkuntza enum('ES', 'EU', 'EN', 'FR', 'DE', 'CA', 'GA', 'AR') not null primary key,
deskribapena varchar(30) not null
);

Create table PODCAST(
id_audio smallint not null,
kolaboratzaileak varchar(40), 
id_podcaster varchar(5) not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_podcaster) references podcaster (id_podcaster)
);

Create table ALBUM(
id_album varchar(20) not null,
izenburua varchar(20) not null,
urtea date not null,
generoa varchar(20) not null,
id_musikaria varchar(5) not null,
PRIMARY KEY (id_album),
FOREIGN KEY (id_musikaria) references musikaria (id_musikaria)
);

Create table ABESTIA(
id_audio smallint not null,
id_album varchar(20) not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_album) references album (id_album) on delete cascade on update cascade
);

Create table BEZEROA(
id_bezeroa varchar(5) not null,
izena varchar(10) not null,
abizena varchar(10) not null,
id_hizkuntza enum('ES', 'EU', 'EN', 'FR', 'DE', 'CA', 'GA', 'AR') not null,
erabiltzailea varchar(15) not null unique,
pasahitza varchar(10) not null,
jaiotze_data date not null,
erregistro_data date not null,
mota enum('free', 'premium') not null,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_hizkuntza) references hizkuntza (id_hizkuntza)
);

Create table PREMIUM(
id_bezeroa varchar(5) not null,
iraungitze_data date not null,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade
);

Create table GUSTUKOAK(
id_bezeroa varchar(5) not null,
id_audio smallint not null unique,
PRIMARY KEY (id_bezeroa),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade,
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade
);

Create table ERREPRODUKZIOAK(
id_bezeroa varchar(5) not null,
id_audio smallint not null unique,
erreprodukzio_data date not null,
PRIMARY KEY (id_bezeroa, id_audio, erreprodukzio_data),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa) on delete cascade on update cascade,
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade
);

Create table ESTATISTIKAK(
id_audio smallint not null,
erreprodukzio_total smallint not null,
gehien_gustoko smallint not null,
iruzkinak smallint not null,
deskargak smallint not null,
PRIMARY KEY (id_audio),
FOREIGN KEY (id_audio) references audio (id_audio)
);

Create table PLAYLIST(
id_list smallint not null,
izenburua varchar(20) not null,
sorrera_data date not null,
id_bezeroa varchar(5) not null,
PRIMARY KEY (id_list),
FOREIGN KEY (id_bezeroa) references bezeroa (id_bezeroa)
);

Create table PLAYLIST_ABESTIAK(
id_audio smallint not null,
id_list smallint not null,
fecha date not null,
PRIMARY KEY (id_audio, id_list),
FOREIGN KEY (id_audio) references audio (id_audio) on delete cascade on update cascade,
FOREIGN KEY (id_list) references playlist (id_list)
);

