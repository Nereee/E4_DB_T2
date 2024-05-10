
----------------------------------------- PROZEDURAK EDO/ETA FUNTZIOAK -----------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE podcasta_berria_sartu(
    IN p_id_audio INT,
    IN p_kolaboratzaileak VARCHAR(40),
    IN p_id_podcaster INT
)
BEGIN
    INSERT INTO podcast (id_audio, kolaboratzaileak, id_podcaster)
    VALUES (p_id_audio, p_kolaboratzaileak, p_id_podcaster);
END //
DELIMITER ;


DELIMITER //
CREATE FUNCTION erreprodukzioen_batazbesteko_kalkulatu() RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE batazbesteko DECIMAL(10, 2);
    SELECT AVG(erreprodukzio_total) INTO batazbesteko
    FROM estatistikak;
    RETURN batazbesteko;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE premium_kontuaren_iragungitze_data_eguneratu(
    IN p_id_bezeroa INT,
    IN p_berria_data DATE
)
BEGIN
    UPDATE premium
    SET iraungitze_data = p_berria_data
    WHERE id_bezeroa = p_id_bezeroa;
END //
DELIMITER ;