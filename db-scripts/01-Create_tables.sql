
CREATE TYPE roles AS ENUM ('user', 'owner', 'admin');
CREATE TYPE colors AS ENUM ('blanche', 'blonde', 'ambrée', 'brune', 'noire');

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    password TEXT NOT NULL, --TEXT pour pouvoir y entrer un mdp hashé (donc long)
    role roles NOT NULL -- Utilise le type ENUM personnalisé
);

CREATE TABLE breweries (
    brewery_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    region VARCHAR(50),
    description TEXT NOT NULL,
    address TEXT,
    picture_url VARCHAR(255),
    website_url VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE SET NULL
);

CREATE TABLE beers (
    beer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL, -- Numéric à virgule pour un prix
    description TEXT NOT NULL,
    color colors NOT NULL, -- Utilise le type ENUM personnalisé
    abv INT NOT NULL,
    picture_url VARCHAR(255),
    production_date DATE, -- Format aaaa-mm-dd
    brewery_id INT NOT NULL,
    FOREIGN KEY (brewery_id) REFERENCES breweries (brewery_id) ON DELETE CASCADE
);

CREATE TABLE pictures (
    picture_id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    legend VARCHAR(50),
    beer_id INT NOT NULL,
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id) ON DELETE CASCADE
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE beer_has_category (
    beer_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (beer_id, category_id),
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE CASCADE
);

CREATE TABLE ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) 
);

CREATE TABLE beer_has_ingredient (
    beer_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (beer_id, ingredient_id),
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    user_id INT NOT NULL,
    beer_id INT NOT NULL,
    UNIQUE (user_id, beer_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id) ON DELETE CASCADE    
);

CREATE TABLE favorites (
    beer_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (beer_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id) ON DELETE CASCADE  
);