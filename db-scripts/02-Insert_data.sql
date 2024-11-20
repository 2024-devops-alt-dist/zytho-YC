INSERT INTO users (first_name, last_name, email, password, role)
VALUES
('Jean', 'Dupont', 'jean.dupont@example.com', 'password123', 'user'),
('Marie', 'Durand', 'marie.durand@example.com', 'password456', 'owner'),
('Paul', 'Martin', 'paul.martin@example.com', 'password789', 'admin'),
('Sophie', 'Bernard', 'sophie.bernard@example.com', 'password321', 'user');

INSERT INTO breweries (name, country, region, description, address, picture_url, website_url, user_id)
VALUES
('La Brasserie du Mont', 'France', 'Alpes', 'Brasserie artisanale spécialisée dans les bières de montagne.', '10 Rue des Alpes, 74000 Annecy', 'https://example.com/pic1.jpg', 'https://montbrewery.com', 2),
('Brasserie de la Loire', 'France', 'Loire', 'Brasserie traditionnelle avec des bières locales.', '15 Avenue des Vins, 42000 Saint-Étienne', 'https://example.com/pic2.jpg', 'https://loirebrewery.com', 3),
('Bière des Champs', 'Belgique', 'Wallonie', 'Une brasserie produisant des bières à base de céréales locales.', '5 Rue des Champs, 5000 Namur', 'https://example.com/pic3.jpg', 'https://bierechamps.be', 2);

INSERT INTO beers (name, price, description, color, abv, picture_url, production_date, brewery_id)
VALUES
('Blonde du Mont', 5, 'Bière blonde légère avec des arômes de fruits.', 'blonde', 5, 'https://example.com/beer1.jpg', '2023-03-01', 1),
('Ambrée de la Loire', 6, 'Bière ambrée au goût malté, légèrement sucrée.', 'ambrée', 6, 'https://example.com/beer2.jpg', '2023-04-15', 2),
('Noire des Champs', 7, 'Bière noire au goût riche et fort de café.', 'noire', 7, 'https://example.com/beer3.jpg', '2023-02-10', 3),
('Trollette', 5.50, 'Une blonde douce avec des notes florales.', 'blonde', 4, 'https://example.com/beer4.jpg', '2023-05-01', 1),
('Primus', 6.20, 'Une ambrée complexe aux arômes boisés.', 'ambrée', 5, 'https://example.com/beer5.jpg', '2023-03-12', 2),
('Triple d''Abbaye', 7.50, 'Bière triple avec une touche d''épices.', 'blonde', 8, 'https://example.com/beer6.jpg', '2022-11-20', 3),
('IPA des Rivières', 6.80, 'Une IPA fruitée et bien houblonnée.', 'blonde', 6, 'https://example.com/beer7.jpg', '2023-01-15', 1),
('Castle', 5.30, 'Rafraîchissante avec des notes d''agrumes.', 'blonde', 4, 'https://example.com/beer8.jpg', '2023-06-01', 2),
('Minuit Brute', 7.00, 'Bière brune intense aux saveurs de caramel.', 'brune', 6, 'https://example.com/beer9.jpg', '2023-03-05', 3),
('Porter du Nord', 7.20, 'Un porter robuste avec des touches de chocolat.', 'noire', 7, 'https://example.com/beer10.jpg', '2023-02-18', 1),
('Stout Impérial', 8.00, 'Un stout fort et complexe, aux notes de café et d''alcool.', 'noire', 9, 'https://example.com/beer11.jpg', '2022-12-10', 3),
('Moira Legend', 6.50, 'Une ambrée équilibrée aux saveurs de noix.', 'ambrée', 5, 'https://example.com/beer12.jpg', '2023-02-28', 2),
('Blanche des Neiges', 5.20, 'Une blanche légère et acidulée.', 'blanche', 4, 'https://example.com/beer13.jpg', '2023-01-25', 1);

INSERT INTO pictures (url, legend, beer_id)
VALUES
('https://example.com/beer1_pic1.jpg', 'Bière blonde du Mont', 1),
('https://example.com/beer2_pic1.jpg', 'Ambrée de la Loire', 2),
('https://example.com/beer3_pic1.jpg', 'Noire des Champs', 3),
('https://example.com/beer3_pic2.jpg', '', 3),
('https://example.com/beer3_pic3.jpg', '', 3),
('https://example.com/beer1_pic2.jpg', 'Bière blonde', 1);

INSERT INTO categories (name)
VALUES
('Lager'),
('Ale'),
('Pale ale'),
('Amber ale'),
('Indian pale ale'),
('Stout'),
('Wheat beer'),
('Porter'),
('Fruit beer'),
('Radler'),
('Honey beer'),
('Tripel'),
('IPA');

INSERT INTO beer_has_category (beer_id, category_id)
VALUES
(1, 1),
(2, 1),
(3, 6),
(4, 3),
(5, 4),
(6, 12),
(7, 4);

INSERT INTO ingredients (name, type)
VALUES
('Malt', 'Céréale'),
('Houblon', 'Plante'),
('Levure', 'Micro-organisme'),
('Eau', 'Liquide');

INSERT INTO beer_has_ingredient (beer_id, ingredient_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1); 

INSERT INTO reviews (text, rating, user_id, beer_id)
VALUES
('Très bonne bière, légère et rafraîchissante.', 4, 1, 1),
('Bière agréable, avec un goût malté bien présent.', 5, 2, 2),
('Bière assez forte, parfaite pour les amateurs de saveurs intenses.', 3, 3, 3),
('Très bonne bière!', 4, 3, 12),
('Un peu fade à mon goût...', 2, 3, 10),
('Pas mal.', 3, 2, 8),
('Un sacré goût de pisse.', 1, 1, 6);

INSERT INTO favorites (beer_id, user_id)
VALUES
(1, 1),
(2, 2),
(3, 4),
(5, 1),
(2, 1),
(1, 2);
