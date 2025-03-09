--Create a database if it doesn't exist
CREATE DATABASE IF NOT EXISTS food_recipes;

-- Use the created database
USE food_recipes;

-- Create the Recipe table
CREATE TABLE Recipe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the Ingredient table
CREATE TABLE Ingredient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the Step table (for recipe steps)
CREATE TABLE Step (
    id INT AUTO_INCREMENT PRIMARY KEY,
    instruction TEXT NOT NULL,
    step_order INT NOT NULL
);

-- Create the Dish Category table
CREATE TABLE Dish_Category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create a junction table to handle the many-to-many relationship between Recipe and Ingredients
CREATE TABLE Recipe_Ingredient (
    recipe_id INT,
    ingredient_id INT,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id) ON DELETE CASCADE
);

-- Create a junction table for recipe steps
CREATE TABLE Recipe_Step (
    recipe_id INT,
    step_id INT,
    PRIMARY KEY (recipe_id, step_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (step_id) REFERENCES Step(id) ON DELETE CASCADE
);

-- Create a junction table for dish categories
CREATE TABLE Recipe_Dish_Category (
    recipe_id INT,
    dish_category_id INT,
    PRIMARY KEY (recipe_id, dish_category_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id) ON DELETE CASCADE,
    FOREIGN KEY (dish_category_id) REFERENCES Dish_Category(id) ON DELETE CASCADE
);