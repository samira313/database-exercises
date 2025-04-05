const mongoose = require('mongoose');

//  Step Embedded Schema 
const stepSchema = new mongoose.Schema({
    instruction: String,
    step_order: Number
});

//  Ingredient Embedded Schema 
const ingredientSchema = new mongoose.Schema({
    name: String,
    quantity: String
});

//  Category Embedded Schema 
const categorySchema = new mongoose.Schema({
    name: String
});

//  Recipe Schema (Embedded) 
const recipeSchema = new mongoose.Schema({
    name: String,
    ingredients: [ingredientSchema],
    categories: [categorySchema],
    steps: [stepSchema]
});

//  Export Model 
const Recipe = mongoose.model('Recipe', recipeSchema);

module.exports = Recipe;