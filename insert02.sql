
-- -------------------------------------------------     INSERT    ---------------------------------------------------------


Insert into HIZKUNTZA  values ('ES', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('EU', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('EN', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('FR', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('DE', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('CA', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('GA', 'zuk hautatutako hizkuntzan');
Insert into HIZKUNTZA  values ('AR', 'zuk hautatutako hizkuntzan');


Insert into ALBUM (izenburua, urtea, generoa, id_musikaria) values ('Un verano sin ti', '2022-09-12', 'trap', 1);
Insert into ALBUM (izenburua, urtea, generoa, id_musikaria) values ('Worldwide Angel', '2018-21-02', 'dancehall', 2);
Insert into ALBUM (izenburua, urtea, generoa, id_musikaria) values ('Music of the Spheres', '2021-10-15', 'pop', 3);
Insert into ALBUM (izenburua, urtea, generoa, id_musikaria) values ('Love at First Sting', '1984-03-27', 'rock', 4);


Insert into BEZEROA (izena, abizena, id_hizkuntza, erabiltzailea, pasahitza, jaiotze_data, erregistro_data, mota) values ('Irune', 'Casquet', 'ES', 'icas', 'haia', '2005-01-01', '2023-01-01', 'free');
Insert into BEZEROA (izena, abizena, id_hizkuntza, erabiltzailea, pasahitza, jaiotze_data, erregistro_data, mota) values ('Alaitz', 'Valerio', 'ES', 'aval', 'haia', '2005-05-01', '2023-01-01', 'free');
Insert into BEZEROA (izena, abizena, id_hizkuntza, erabiltzailea, pasahitza, jaiotze_data, erregistro_data, mota) values ('Hegoi', 'Vazquez', 'ES', 'hvazquez', 'haia', '2005-07-01', '2023-01-01', 'free');
Insert into BEZEROA (izena, abizena, id_hizkuntza, erabiltzailea, pasahitza, jaiotze_data, erregistro_data, mota) values ('Andoni', 'Zarraga', 'ES', 'azar', 'haia', '2005-10-01', '2023-01-01', 'free');


Insert into ABESTIA (id_audio, id_album) values (1, 1);
Insert into ABESTIA (id_audio, id_album) values (2, 1);
Insert into ABESTIA (id_audio, id_album) values (3, 1);
Insert into ABESTIA (id_audio, id_album) values (4, 2);
Insert into ABESTIA (id_audio, id_album) values (5, 2);
Insert into ABESTIA (id_audio, id_album) values (6, 2);
Insert into ABESTIA (id_audio, id_album) values (7, 3);
Insert into ABESTIA (id_audio, id_album) values (8, 3);
Insert into ABESTIA (id_audio, id_album) values (9, 3);
Insert into ABESTIA (id_audio, id_album) values (10, 4);
Insert into ABESTIA (id_audio, id_album) values (11, 4);
Insert into ABESTIA (id_audio, id_album) values (12, 4);

