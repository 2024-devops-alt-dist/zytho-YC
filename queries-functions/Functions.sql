-- Écrire une procédure stockée permettant à un utilisateur de noter une bière. Si l'utilisateur a déjà noté cette bière, la note est mise à jour ; sinon, une nouvelle note est ajoutée.

CREATE OR REPLACE FUNCTION add_review(t_user_id INT, t_beer_id INT, new_text TEXT, new_rating INT)
RETURNS VOID AS $$
BEGIN 
    INSERT INTO reviews (user_id, beer_id, text, rating)
    VALUES (t_user_id, t_beer_id, new_text, new_rating)
    ON CONFLICT (user_id, beer_id)
    DO UPDATE SET text = EXCLUDED.text, rating = EXCLUDED.rating;
END;
$$ LANGUAGE plpgsql;

-- Écrire un déclencheur (trigger) pour vérifier que l'ABV (taux d'alcool) est compris entre 0 et 20 avant l'ajout de chaque bière.

CREATE OR REPLACE FUNCTION check_abv() RETURNS TRIGGER AS $$
 BEGIN
    IF NEW.abv < 0 OR NEW.abv > 20 THEN
        RAISE EXCEPTION 'ABV must be between 0 and 20°. You wrote : %', NEW.abv;
    END IF;
    RETURN NEW;
 END;
 $$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_abv
BEFORE INSERT OR UPDATE
ON beers
FOR EACH ROW
EXECUTE FUNCTION check_abv();
