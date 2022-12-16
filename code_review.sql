-- **Selecting Values**
--   * Select the name and part_num columns from the parts table. Show only names that include the substring 'Hair', and order them with the part_num in descending order

--   * From the sets table, select all the sets that included the word 'Showdown' in the name between 1990 and 2015

--   * Aliasing the part_categories table as p, show the id and name of the values in that table where the name includes the word 'Bricks'
  
SELECT name, num_parts
FROM sets
WHERE name LIKE "%Hair%"
ORDER BY num_parts DESC;

SELECT name
FROM sets
WHERE name LIKE "%Showdown%" AND year BETWEEN 1990 AND 2015;

SELECT id, name 
FROM part_categories AS p
WHERE name LIKE "%Bricks%";

-- **Subqueries**
--   * Select all the ids from the themes table with 'Pirates' or 'Star Wars' in the name. This is your subquery. Then show the names of all the sets where the theme_id matches an id in that subquery.

--   * Select the ids of the values in the inventories table that have more than one version (i.e. version > 1). This is your subquery. Then select everything from the inventory_parts table where the inventory_id matches an id in that subquery. Limit the output to 10 rows.

SELECT name 
FROM sets
WHERE theme_id IN 
(SELECT id FROM themes WHERE name REGEXP "Pirates|Star Wars");

SELECT * 
FROM inventory_parts 
WHERE inventory_id IN 
(SELECT id FROM inventories WHERE version > 1)
LIMIT 10;

-- **Manipulate Values in Select**
--   * Aliasing the sets table as 's', select the year and name of the values in that table that include the substring 'Batman'. Concatenate three exclamation marks to the end of each name, and make all the names upper case.

--   * For every quantity value greater than 1 in the inventory_parts table, double the value of the quantity. Limit your output to 20 rows, and order it by quantity.

-- **Aggregation Functions**
--   * Count the total number of transparent colors in the colors table (Note: is_trans is a binary value, and you want to show how many rows there are where it equals 1).

--   * Show the sum of all the parts for all the sets that came out since the year 2000.

--   * Show the average number of parts for sets that came out since the year 2000.

--   * Using GROUP BY, show the average number of parts for each theme_id in sets.

-- **Joins** 
--   * Using a free-form join (where the JOIN type isn't specified, equivalent to an inner join), join the parts and part_categories tables. Filter for values where the part_categories id matches the parts part_cat_id, and where the name of the part contains the word 'Werewolf'.
