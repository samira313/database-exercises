const mongoose = require('mongoose');
const Recipe = require('./Embedded-model-recipes');

mongoose.connect('mongodb://127.0.0.1:27017/food_recipes')
    .then(() => console.log("Connected to MongoDB"))
    .catch((err) => console.error("Could not connect", err));

async function seed() {
    await Recipe.deleteMany({}); 

    await Recipe.create([
        {
            name: "Pizza",
            ingredients: [
                { name: "Flour", quantity: "500g" },
                { name: "Water", quantity: "300ml" },
                { name: "Cheese", quantity: "200g" }
            ],
            categories: [
                { name: "Italian" }, 
                { name: "FastFood" }
            ],
            steps: [
                { instruction: "Mix the flour and water.", step_order: 1 },
                { instruction: "Add cheese.", step_order: 2 },
                { instruction: "Bake in oven.", step_order: 3 }
            ]
        },
        {
            name: "Salad",
            ingredients: [
                { name: "Lettuce", quantity: "1 piece" },
                { name: "Tomato", quantity: "2 pieces" }
            ],
            categories: [
                { name: "Vegetarian" }
            ],
            steps: [
                { instruction: "Chop the vegetables.", step_order: 1 },
                { instruction: "Mix all together.", step_order: 2 }
            ]
        }
    ]);

    console.log('Embedded seed completed!');
    mongoose.connection.close();
}

seed();