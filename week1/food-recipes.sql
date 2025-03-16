-- Use the created databaseDROP DATABASE IF EXISTS food_recipes;
DROP DATABASE IF EXISTS food_recipes;
CREATE DATABASE food_recipes;
USE food_recipes;

-- Create the Recipe table
CREATE TABLE IF NOT EXISTS recipe (
   recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the Ingredient table
CREATE TABLE IF NOT EXISTS ingredient (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the Step table (for recipe steps)
CREATE TABLE IF NOT EXISTS step (
    step_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    instruction TEXT NOT NULL,
    step_order INT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE
);

-- Create the Dish Category table
CREATE TABLE IF NOT EXISTS category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create a junction table to handle the many-to-many relationship between Recipe and Ingredients
CREATE TABLE IF NOT EXISTS recipe_ingredient (
    recipe_id INT,
    ingredient_id INT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(reciep_id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id) ON DELETE CASCADE
);

-- Create a junction table for recipe steps
CREATE TABLE IF NOT EXISTS recipe_step (
    recipe_id INT,
    step_id INT,
    PRIMARY KEY (recipe_id, step_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE,
    FOREIGN KEY (step_id) REFERENCES step(step_id) ON DELETE CASCADE
);

-- Create a junction table for dish categories
CREATE TABLE IF NOT EXISTS recipe_category (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(category_id) ON DELETE CASCADE
);