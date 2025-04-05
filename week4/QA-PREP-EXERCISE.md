# QA Prep Exercise - Week 4

## Exercise

### 1. What are the collections?

For the Recipe Application, we will have the following collections:

- *Recipes* : Stores each recipe.
- *Ingredients* : Stores all ingredients.
- *Categories* : Stores the categories of recipes.
- *Steps* : Stores step-by-step instructions for recipes.

---

### 2. What information will you embed in a document and which will you store normalized?

We designed the data model in two ways:

#### A- Embedded Model:

In this model, we embedded:
- *Ingredients*: Directly inside the Recipe document.
- *Categories*: Embedded inside the Recipe.
- *Steps*: Embedded inside the Recipe.

Since each recipe has its own specific ingredients, categories, and steps that are rarely shared with others, embedding makes reading faster and the structure simpler.

#### B- Normalized Model:

In this model, we normalized:
- *Ingredients*: Stored in a separate collection, referenced by the Recipe.
- *Categories*: Stored in a separate collection, referenced by the Recipe.
- *Steps*: Stored in a separate collection, referenced by the Recipe.

This is useful if:
- Ingredients or Categories are reusable across recipes.
- We want to avoid data duplication.

---

### Discussion

### Q1: What made you decide when to embed information? What assumptions did you make?

I chose to embed information when:
- The data is highly related to the parent document (e.g., Steps belong only to one Recipe).
- The sub-data is not reused by other documents (e.g., Steps, Ingredients).
- Embedding makes queries simpler and faster for read-heavy applications.

I chose to normalize when:
- The data might be reused across documents (e.g., some Ingredients and Categories could appear in multiple recipes).
- The dataset is expected to grow and require updates (e.g., updating one Ingredient affects many Recipes).

---

### Q2: If you were given MySQL and MongoDB as choices to build the recipe's database at the beginning, which one would you choose and why?

I would choose *MongoDB* because:
- The data structure is naturally hierarchical.
- Embedding simplifies the design and improves read performance.
- There is no need for complex joins like in SQL.
- Recipes are usually read more often than written, which fits MongoDB's strengths.
- MongoDB is flexible for changes in document structure.

---

### Example Queries (For Normalized Model)

```js
// Find all recipes
db.recipes.find()

// Find recipes that are vegetarian
db.recipes.find({ categoryIds: vegetarian_id })

// List all ingredients
db.ingredients.find()

// Get steps for a specific recipe
db.steps.find({ _id: { $in: recipe.stepIds } })
```

### Example Queries (For Embedded Model)

```js
// Get all recipes with their embedded ingredients, categories, and steps
db.recipes.find()

// Get a recipe by name
db.recipes.findOne({ name: "Pizza" })

// Get all recipes that have 'Cheese' as an ingredient
db.recipes.find({ "ingredients.name": "Cheese" })
```
