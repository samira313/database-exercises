const mongoose = require('mongoose');

// Ingredient Schema
const ingredientSchema = new mongoose.Schema({
    name: String,
    quantity: String
});

const Ingredient = mongoose.model('Ingredient', ingredientSchema);

// Category Schema 
const categorySchema = new mongoose.Schema({
    name: String
});

const Category = mongoose.model('Category', categorySchema);

// Step Schema 
const stepSchema = new mongoose.Schema({
    instruction: String,
    step_order: Number
});

const Step = mongoose.model('Step', stepSchema);

// Recipe Schema 
const recipeSchema = new mongoose.Schema({
    name: String,
    ingredientIds: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Ingredient' }],
    categoryIds: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Category' }],
    stepIds: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Step' }]
});

const Recipe = mongoose.model('Recipe', recipeSchema);

// Export all models 
module.exports = {
    Ingredient,
    Category,
    Step,
    Recipe
};