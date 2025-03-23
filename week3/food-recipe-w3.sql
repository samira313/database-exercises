-- Use the existing database
USE food_recipes;


-- Table Definitions (Normalized to 3NF)


-- Recipe Table: Stores each recipe
CREATE TABLE recipe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Ingredient Table: Stores each unique ingredient
CREATE TABLE ingredient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Category Table: Stores recipe categories
CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Step Table: Stores each unique instruction

CREATE TABLE step (
    id INT PRIMARY KEY AUTO_INCREMENT,
    instruction TEXT NOT NULL
);

-- Recipe_Ingredient Table: Many-to-Many between recipes and ingredients
CREATE TABLE recipe_ingredient (
    recipe_id INT,
    ingredient_id INT,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
);

-- Recipe_Category Table: Many-to-Many between recipes and categories
CREATE TABLE recipe_category (
    recipe_id INT,
    category_id INT,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Recipe_Step Table: Many-to-Many between recipes and steps
-- Now includes step_order for each step in a specific recipe

CREATE TABLE recipe_step (
    recipe_id INT,
    step_id INT,
    step_order INT,
    PRIMARY KEY (recipe_id, step_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
    FOREIGN KEY (step_id) REFERENCES step(step_id)
);
-- NF1 
-- all columns are atomic values and have a primary key 

-- NF2 
-- non key attributes depend on the composite primary key 
-- in (recipe_categories) , (recipe_ingredients) , (recipe_steps)
-- non key attributes (quantity , step_order) depend on composite 
-- primary key 

--NF3 
-- all attributes depend on primary key , without transitive dependency 



-- Data Insertions

-- Insert Categories
INSERT INTO category (name) VALUES 
    ('Cake'),
    ('No-Bake'),
    ('Vegetarian'),
    ('Vegan'),
    ('Gluten-Free'),
    ('Japanese');

-- Insert Recipes
INSERT INTO recipe (name) VALUES
    ('No-Bake Cheesecake'),              
    ('Roasted Brussels Sprouts'),        
    ('Mac & Cheese'),                    
    ('Tamagoyaki Japanese Omelette');    

-- Insert Ingredients
INSERT INTO ingredient (name) VALUES 
    ('Condensed Milk'),                  
    ('Cream Cheese'),                   
    ('Lemon Juice'),                    
    ('Pie Crust'),                       
    ('Cherry Jam'),                     
    ('Brussels Sprouts'),               
    ('Sesame Seeds'),                    
    ('Pepper'),                          
    ('Salt'),                           
    ('Olive Oil'),                       
    ('Macaroni'),                        
    ('Butter'),                          
    ('Flour'),                           
    ('Milk'),                            
    ('Shredded Cheddar Cheese'),         
    ('Eggs'),                            
    ('Soy Sauce'),                       
    ('Sugar');                           
-- Insert Steps (No step_order here!)
INSERT INTO step (instruction) VALUES
    -- No-Bake Cheesecake (steps 1–6)
    ('Beat Cream Cheese'),                                
    ('Add condensed Milk and blend'),                     
    ('Add Lemon Juice and blend'),                  
    ('Add the mix to the pie crust'),                    
    ('Spread the Cherry Jam'),                           
    ('Place in refrigerator for 3h.'),                 

    -- Roasted Brussels Sprouts (steps 7–10)
    ('Preheat the oven'),                                
    ('Mix the ingredients in a bowl'),                
    ('Spread the mix on baking sheet'),                   
    ('Bake for 30 minutes'),                            

    -- Mac & Cheese (steps 11–17)
    ('Cook Macaroni for 8 minutes'),                      
    ('Melt butter in a saucepan'),                        
    ('Add flour, salt, pepper and mix'),                  
    ('Add Milk and mix'),                                 
    ('Cook until mix is smooth'),                         
    ('Add cheddar cheese'),                              
    ('Add the macaroni'),                                

    -- Tamagoyaki (steps 18–27)
    ('Beat the eggs'),                                   
    ('Add soya sauce, sugar and salt'),                   
    ('Add oil to a sauce pan'),                          
    ('Bring to medium heat'),                             
    ('Add some mix to the sauce pan'),                   
    ('Let it cook for 1 minute'),                         
    ('Add oil to a sauce pan again'),                     
    ('Add some mix to the sauce pan again'),              
    ('Let it cook for 1 minute'),                         
    ('Remove pan from fire');                             

-- Insert Recipe ↔ Ingredient Links
INSERT INTO recipe_ingredient (recipe_id, ingredient_id) VALUES
    -- No-Bake Cheesecake
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),

    -- Roasted Brussels Sprouts
    (2, 6), (2, 3), (2, 7), (2, 8), (2, 9), (2, 10),

    -- Mac & Cheese
    (3, 11), (3, 12), (3, 13), (3, 9), (3, 8), (3, 14), (3, 15),

    -- Tamagoyaki
    (4, 16), (4, 17), (4, 18), (4, 9), (4, 10);

-- Insert Recipe ↔ Category Links
INSERT INTO recipe_category (recipe_id, category_id) VALUES
    (1, 1), (1, 2), (1, 3),   -- Cheesecake: Cake, No-Bake, Vegetarian
    (2, 4), (2, 5),           -- Brussels Sprouts: Vegan, Gluten-Free
    (3, 3),                   -- Mac & Cheese: Vegetarian
    (4, 3), (4, 6);           -- Tamagoyaki: Vegetarian, Japanese

-- Insert Recipe ↔ Step Links (Now includes step_order!)
INSERT INTO recipe_step (recipe_id, step_id, step_order) VALUES
    -- No-Bake Cheesecake
    (1, 1, 1), (1, 2, 2), (1, 3, 3), (1, 4, 4), (1, 5, 5), (1, 6, 6),

    -- Roasted Brussels Sprouts
    (2, 7, 1), (2, 8, 2), (2, 9, 3), (2, 10, 4),

    -- Mac & Cheese
    (3, 11, 1), (3, 12, 2), (3, 13, 3), (3, 14, 4),
    (3, 15, 5), (3, 16, 6), (3, 17, 7),

    -- Tamagoyaki
    (4, 18, 1), (4, 19, 2), (4, 20, 3), (4, 21, 4),
    (4, 22, 5), (4, 23, 6), (4, 24, 7), (4, 25, 8),
    (4, 26, 9), (4, 27, 10);
