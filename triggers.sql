 -- ------------------------------------------------ TRIGGERS ----------------------------------------------------------------
 
#1
DELIMITER //

CREATE TRIGGER erreprodukzioak_eguneratuak AFTER INSERT ON erreprodukzioak
FOR EACH ROW
BEGIN
	-- Estatistikak taulan erreprodukzioen kontagailu osoa handitzea
    UPDATE estatistikak
    SET erreprodukzio_total = erreprodukzio_total + 1
    WHERE id_audio = NEW.id_audio;
END;
//



#2
DELIMITER //

CREATE TRIGGER eguneratu_gustukoen_zerrenda AFTER INSERT ON gustukoak
FOR EACH ROW
BEGIN
	DECLARE id_bezeroa INT;
    DECLARE id_audio INT;
    
    select NEW.id_bezeroa, NEW.id_audio INTO id_bezeroa, id_audio;
    
    IF NOT EXISTS (SELECT * FROM gustukoak WHERE id_bezeroa = id_bezeroa AND id_audio = id_audio) THEN
        INSERT INTO gustukoak (id_bezeroa, id_audio) VALUES (id_bezeroa, id_audio);
    END IF;
END;
//



#3
DELIMITER //


END;
//

