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

def breakfast_recipes()
  run_sql("SELECT * FROM meal_planning WHERE category = 'Breakfast';")
end

def am_snack_recipes()
  run_sql("SELECT * FROM meal_planning WHERE category = 'AM Snack';")
end

def lunch_recipes()
  run_sql("SELECT * FROM meal_planning WHERE category = 'Lunch';")
end

def pm_snack_recipes()
  run_sql("SELECT * FROM meal_planning WHERE category = 'PM Snack';")
end

def dinner_recipes()
  run_sql("SELECT * FROM meal_planning WHERE category = 'Dinner';")
end