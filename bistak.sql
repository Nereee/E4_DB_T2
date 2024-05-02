
-- ------------------------------------------------------------------BISTAK ----------------------------------------------------------------------------------------------------------

-- Musika artista eta podkaster guztien zerrenda haien deskribapenekin:
CREATE VIEW bista_artistak_podcasterrak AS
SELECT id_musikaria AS id, izenArtistikoa AS izena, 'Musikaria' AS mota, deskribapena
FROM musikaria
UNION ALL
SELECT id_podcaster AS id, izenArtistikoa AS izena, 'Podcaster' AS mota, deskribapena
FROM podcaster;



-- Erabiltzaile bakoitzaren azken erreprodukzioen zerrenda:
CREATE VIEW erreprodukzio_bista AS
SELECT id_bezeroa, id_audio, erreprodukzio_data
FROM erreprodukzioak
ORDER BY erreprodukzio_data DESC;



-- Album guztien zerrenda dagozkien artistekin eta generoekin:
CREATE VIEW album_bista AS
SELECT a.id_album, a.izenburua AS izena_album, a.urtea, a.generoa, m.izenArtistikoa AS izena_artista
FROM album a
JOIN musikaria m ON a.id_musikaria = m.id_musikaria
UNION ALL
SELECT a.id_album, a.izenburua AS izena_album, a.urtea, a.generoa, p.izenArtistikoa AS izena_podcaster
FROM album a
JOIN podcaster p ON a.id_musikaria = p.id_podcaster;

