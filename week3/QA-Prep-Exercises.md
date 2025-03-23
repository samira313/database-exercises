### Was your database already in 2NF / 3NF?

- The database was in 1NF because all the values in the tables were atomic (no repeating groups or multivalued fields).

- However, it was not fully in 2NF, because:

    The step table included a step_order field that only made sense in the context of a recipe.

    This caused a partial dependency because step_order depends on part of a composite key (the step), not the whole relationship.

- It was also not in 3NF due to this design flaw, as it introduced a kind of transitive dependency.


### What changes did you have to do to normalize your database?

✅ Changes made:

1. Moved step_order to a new table ****recipe_step:

  Now step_order is stored in a table that also includes recipe_id and step_id.

  This allows a many-to-many relationship between recipes and steps.

2. Created recipe_step as a junction table:

<pre>
```sql
CREATE TABLE recipe_step (
    recipe_id INT,
    step_id INT,
    step_order INT,
    PRIMARY KEY (recipe_id, step_id),
    FOREIGN KEY (recipe_id) REFERENCES recipe(id),
    FOREIGN KEY (step_id) REFERENCES step(id)
);
```
</pre>


### Discussion: Scaling the Database

What challenges do you foresee if you want to add thousands of recipes?

1. Performance Issues

- As the number of records grows, joins across multiple many-to-many tables may slow down queries.

- Indexes need to be carefully optimized for searching, filtering, and sorting.

2. Data Integrity

- With a larger volume, ensuring data consistency (e.g., valid foreign keys, duplicate ingredients or categories) becomes more critical.

3. Search and Filtering

- Efficient full-text search or filtering by categories, ingredients, or tags may require additional indexing or search engine integration.

4. Maintenance

- Managing updates, backups, and schema changes becomes more complex as the data volume increases.


### Summary

- The database is now fully normalized up to 3NF.

- Redundant and dependent data is eliminated.

- Many-to-many relationships are handled with junction tables.

- The structure is now scalable, consistent, and more maintainable for future growth.