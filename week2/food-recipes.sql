-- Use the existing database
USE food_recipes;

-- Insert categories
INSERT INTO category (name) VALUES 
    ('Cake'),
    ('No-Bake'),
    ('Vegetarian'),
    ('Vegan'),
    ('Gluten-Free'),
    ('Japanese');

-- Insert new recipes
INSERT INTO recipe (name) VALUES
    ('No-Bake Cheesecake'),
    ('Roasted Brussels Sprouts'),
    ('Mac & Cheese'),
    ('Tamagoyaki Japanese Omelette');

-- Insert ingredients
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
-- No-Bake Cheesecake
INSERT INTO step (instruction, step_order) VALUES
    ('Beat Cream Cheese', 1),
    ('Add condensed Milk and blend', 2),
    ('Add Lemon Juice and blend', 3),
    ('Add the mix to the pie crust', 4),
    ('Spread the Cherry Jam', 5),
    ('Place in refrigerator for 3h.', 6);

-- Roasted Brussels Sprouts
INSERT INTO Step (instruction, step_order) VALUES
    ('Preheat the oven', 7),
    ('Mix the ingredients in a bowl', 8),
    ('Spread the mix on baking sheet', 9),
    ('Bake for 30 minutes', 10);

-- Mac & Cheese
INSERT INTO step (instruction, step_order) VALUES
    ('Cook Macaroni for 8 minutes', 11),
    ('Melt butter in a saucepan', 12),
    ('Add flour, salt, pepper and mix', 13),
    ('Add Milk and mix', 14),
    ('Cook until mix is smooth', 15),
    ('Add cheddar cheese', 16),
    ('Add the macaroni', 17);

-- Tamagoyaki Japanese Omelette
INSERT INTO step (instruction, step_order) VALUES
    ('Beat the eggs', 18),
    ('Add soya sauce, sugar and salt', 19),
    ('Add oil to a sauce pan', 20),
    ('Bring to medium heat', 21),
    ('Add some mix to the sauce pan', 22),
    ('Let it cook for 1 minute', 23),
    ('Add oil to a sauce pan again', 24),
    ('Add some mix to the sauce pan again', 25),
    ('Let it cook for 1 minute', 26),
    ('Remove pan from fire', 27);

-- Link recipes to categories (many-to-many)
INSERT INTO recipe_category (recipe_id, category_id) VALUES
    (1, 1), -- No-Bake Cheesecake → Cake
    (1, 2), -- No-Bake Cheesecake → No-Bake
    (1, 3), -- No-Bake Cheesecake → Vegetarian
    (2, 4), -- Roasted Brussels Sprouts → Vegan
    (2, 5), -- Roasted Brussels Sprouts → Gluten-Free
    (3, 3), -- Mac & Cheese → Vegetarian
    (4, 3), -- Tamagoyaki Japanese Omelette → Vegetarian
    (4, 6); -- Tamagoyaki Japanese Omelette → Japanese

-- Link recipes to ingredients (many-to-many)
INSERT INTO recipe_ingredient (recipe_id, ingredient_id) VALUES
    -- No-Bake Cheesecake
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5),

    -- Roasted Brussels Sprouts
    (2, 6), (2, 3), (2, 7), (2, 8), (2, 9), (2, 10),

    -- Mac & Cheese
    (3, 11), (3, 12), (3, 13), (3, 9), (3, 8), (3, 14), (3, 15),

    -- Tamagoyaki Japanese Omelette
    (4, 16), (4, 17), (4, 18), (4, 9), (4, 10);

-- Link recipes to steps (many-to-many)
    INSERT INTO recipe_step (recipe_id, step_id) VALUES
    -- No-Bake Cheesecake
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),

    -- Roasted Brussels Sprouts
    (2, 7), (2, 8), (2, 9), (2, 10),

    -- Mac & Cheese
    (3, 11), (3, 12), (3, 13), (3, 14), (3, 15), (3, 16), (3, 17),

    -- Tamagoyaki Japanese Omelette
    (4, 18), (4, 19), (4, 20), (4, 21), (4, 22), (4, 23), (4, 24), (4, 25), (4, 26), (4, 27);