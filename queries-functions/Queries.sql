-- Lister les bières par taux d'alcool, de la plus légère à la plus forte.

SELECT name, abv 
FROM beers 
ORDER BY abv ASC;

-- Afficher le nombre de bières par catégorie.

SELECT categories.name, COUNT(beer_has_category.beer_id) AS beer_count
FROM categories
LEFT JOIN beer_has_category ON categories.category_id = beer_has_category.category_id
GROUP BY categories.name;

-- Trouver toutes les bières d'une brasserie donnée.

SELECT beers.name 
FROM beers 
JOIN breweries ON beers.brewery_id = breweries.brewery_id
WHERE breweries.name = 'La Brasserie du Mont';

-- Lister les utilisateurs et le nombre de bières qu'ils ont ajoutées à leurs favoris.

SELECT users.first_name, COUNT(favorites.beer_id) AS beer_count
FROM users
LEFT JOIN favorites ON users.user_id = favorites.user_id
GROUP BY users.first_name;

-- Ajouter une nouvelle bière à la base de données.

INSERT INTO beers (name, price, description, color, abv, picture_url, production_date, brewery_id)
VALUES
('Bière de Noël',4.2, 'Bière ambrée rehaussée d''épices de Noël', 'ambrée', 5, 'https://example.com/beer1.jpg', '2024-12-01', 1);

-- Afficher les bières et leurs brasseries, ordonnées par pays de la brasserie.

SELECT beers.name, breweries.name, breweries.country
FROM beers
LEFT JOIN breweries ON breweries.brewery_id = beers.brewery_id
ORDER BY breweries.country ASC;

-- Lister les bières avec leurs ingrédients.

SELECT beers.name AS beer_name, ingredients.name AS ingredient_name
FROM beers
JOIN beer_has_ingredient
ON beers.beer_id = beer_has_ingredient.beer_id
JOIN ingredients
ON ingredients.ingredient_id = beer_has_ingredient.ingredient_id;

-- Afficher les brasseries et le nombre de bières qu'elles produisent, pour celles ayant plus de 5 bières.

SELECT breweries.name, COUNT(beers.beer_id) AS beer_count
FROM breweries
LEFT JOIN beers ON breweries.brewery_id = beers.brewery_id
GROUP BY breweries.brewery_id, breweries.name
HAVING COUNT(beers.beer_id) > 5
ORDER BY beer_count DESC;

-- Lister les bières qui n'ont pas encore été ajoutées aux favoris par aucun utilisateur.

SELECT beers.beer_id, beers.name
FROM beers
LEFT JOIN favorites ON beers.beer_id = favorites.beer_id
WHERE favorites.beer_id IS NULL;


-- Trouver les bières favorites communes entre deux utilisateurs.

SELECT beers.beer_id, beers.name AS beer_name
FROM favorites f1
JOIN favorites f2 ON f1.beer_id = f2.beer_id
JOIN beers ON f1.beer_id  = beers.beer_id
WHERE f1.user_id = 1 AND f2.user_id = 2;

-- Afficher les brasseries dont les bières ont une moyenne de notes supérieure à une certaine valeur (2).

SELECT breweries.name, AVG(reviews.rating) AS average_beer_rating
FROM breweries
JOIN beers
ON breweries.brewery_id = beers.brewery_id
JOIN reviews
ON beers.beer_id = reviews.beer_id
GROUP BY breweries.brewery_id, breweries.name
HAVING AVG(reviews.rating) > 2
ORDER BY average_beer_rating ASC;

-- Mettre à jour les informations d'une brasserie.

UPDATE breweries
SET name = 'Bières de Namur'
WHERE brewery_id = 3;

-- Supprimer les photos d'une bière en particulier.

DELETE FROM pictures
WHERE beer_id = 1;

-- Test de la procédure stockée de mise à jour d'une review
    -- Nouvelle review

SELECT add_review(1, 7, 'Un peu trop forte pour moi...', 2);

    -- Mise à jour d'une review

SELECT add_review(1, 7, 'Après un deuxième essai, elle est pas si mal finalement.', 4);

-- Test trigger pour l'abv
    -- abv correct (entre 0 et 20)

INSERT INTO beers (name, price, description, color, abv, picture_url, production_date, brewery_id)
VALUES
('La Paloma', 5, 'Bière sucrée au goût de petits chats', 'ambrée', 2, 'https://example.com/beer1.jpg', '2023-03-01', 3);

    -- abv incorrect 

INSERT INTO beers (name, price, description, color, abv, picture_url, production_date, brewery_id)
VALUES
('Destroyer of the World!!!', 10, 'METAAAAAAAL', 'noire', 48, 'https://example.com/beer1.jpg', '2023-03-01', 1);