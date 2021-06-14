def all_meals()
  run_sql("SELECT * FROM meal_planning;")
end

def create_recipe(meal_item, calories, ingredients, recipe, category, image_url)

  sql_query = "INSERT INTO meal_planning(meal_item, calories, ingredients, recipe, category, image_url) VALUES($1, $2, $3, $4, $5, $6);"
  params = [meal_item, calories, ingredients, recipe, category, image_url]

  run_sql(sql_query, params)
end

# hacking sql
# "INSERT INTO food(name, image_url, price) VALUES('f', 'f');UPDATE food SET name='HAXX';SELECT('1'), 8.50);" --- check injection.sql

