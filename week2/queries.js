import fs from "fs/promises";  
import path from "path";
import { createConnection } from "mysql2/promise";

// connect to the database
const connection = await createConnection({
  host: "localhost",
  user: "root",  
  password: "password",  
  database: "food_recipes",  
});

//  execute the query for the database
try {
  const sqlFilePath = path.resolve("../week1/food-recipes.sql");  // route for the sql file
  const sqlQuery = await fs.readFile(sqlFilePath, "utf-8"); // read the sql file

  await connection.query(sqlQuery);  // execute the query
  console.log("SQL file executed successfully!");
} catch (error) {
  console.error("Error executing SQL file:", error);
}

// test for connection
try {
  await connection.connect();
  console.log("Connected to MySQL!");
} catch (error) {
  console.error("Error connecting to MySQL:", error);
}

// Queries
const queries = [
   
    {
        description: "Cakes that do not need baking",
        query: `
            SELECT r.name
            FROM recipe r
            JOIN recipe_category rc ON r.recipe_id = rc.recipe_id
            JOIN category c ON rc.category_id = c.category_id
            WHERE c.name = 'Cake' 
            AND r.recipe_id IN (
                SELECT recipe_id FROM recipe_category 
                WHERE category_id = (SELECT category_id FROM category WHERE name = 'No-Bake')
            );
        `
    },
    {
        description: "Vegetarian recipes containing potatoes",
        query: `
            SELECT r.name
            FROM recipe r
            JOIN recipe_ingredient ri ON r.recipe_id = ri.recipe_id
            JOIN ingredient i ON ri.ingredient_id = i.ingredient_id
            JOIN recipe_category rc ON r.recipe_id = rc.recipe_id
            JOIN category c ON rc.category_id = c.category_id
            WHERE i.name = 'Potato' AND c.name = 'Vegetarian';
        `
    },

    {
        description: "Vegan and Japanese recipes",
        query: `
            SELECT DISTINCT r.name
            FROM recipe r
            JOIN recipe_category rc ON r.recipe_id = rc.recipe_id
            JOIN category c ON rc.category_id = c.category_id
            WHERE c.name IN ('Vegan', 'Japanese');
        `
    }
];

