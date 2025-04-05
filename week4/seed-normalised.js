const mongoose = require('mongoose');
const { Recipe, Ingredient, Category, Step } = require('./Normalised-model-recipes');

mongoose.connect('mongodb://127.0.0.1:27017/food_recipes')
    .then(() => console.log("Connected to MongoDB"))
    .catch((err) => console.error("Could not connect", err));

async function seed() {
        await Promise.all([
              Recipe.deleteMany({}),
              Ingredient.deleteMany({}),
              Category.deleteMany({}),
              Step.deleteMany({})
]);

// Ingredients
const flour = await Ingredient.create({ name: "Flour", quantity: "500g" });
const water = await Ingredient.create({ name: "Water", quantity: "300ml" });
const cheese = await Ingredient.create({ name: "Cheese", quantity: "200g" });

const lettuce = await Ingredient.create({ name: "Lettuce", quantity: "1 piece" });
const tomato = await Ingredient.create({ name: "Tomato", quantity: "2 pieces" });

// Categories
const italian = await Category.create({ name: "Italian" });
const fastFood = await Category.create({ name: "FastFood" });
const vegetarian = await Category.create({ name: "Vegetarian" });

// Steps
const s1 = await Step.create({ instruction: "Mix the flour and water.", step_order: 1 });
const s2 = await Step.create({ instruction: "Add cheese.", step_order: 2 });
const s3 = await Step.create({ instruction: "Bake in oven.", step_order: 3 });

const s4 = await Step.create({ instruction: "Chop the vegetables.", step_order: 1 });
const s5 = await Step.create({ instruction: "Mix all together.", step_order: 2 });

    // Recipes
    await Recipe.create([
        {
            name: "Pizza",
            ingredientIds: [flour._id, water._id, cheese._id],
            categoryIds: [italian._id, fastFood._id],
            stepIds: [s1._id, s2._id, s3._id]
        },
        {
            name: "Salad",
            ingredientIds: [lettuce._id, tomato._id],
            categoryIds: [vegetarian._id],
            stepIds: [s4._id, s5._id]
        }
    ]);

    console.log('Normalized seed completed!');
    mongoose.connection.close();
}

seed();