DROP SCHEMA IF EXISTS cooking_recipe CASCADE;
CREATE SCHEMA IF NOT EXISTS cooking_recipe;

DROP TABLE IF EXISTS cooking_recipe.recipe;
CREATE TABLE IF NOT EXISTS cooking_recipe.recipe (
    recipe_id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    instructions TEXT
);

DROP TABLE IF EXISTS cooking_recipe.ingredient;
CREATE TABLE IF NOT EXISTS cooking_recipe.ingredient (
    ingredient_id SERIAL PRIMARY KEY,
    name TEXT
);

DROP TABLE IF EXISTS cooking_recipe.measure;
CREATE TABLE IF NOT EXISTS cooking_recipe.measure (
    measure_id SERIAL PRIMARY KEY,
    name TEXT
);

DROP TABLE IF EXISTS cooking_recipe.recipe_ingredient;
CREATE TABLE IF NOT EXISTS cooking_recipe.recipe_ingredient (
    recipe_id INT REFERENCES cooking_recipe.recipe (recipe_id),
    ingredient_id INT REFERENCES cooking_recipe.ingredient (ingredient_id),
    measure_id INT REFERENCES cooking_recipe.measure (measure_id),
    amount INT
);