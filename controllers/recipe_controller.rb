get '/' do

  all_recipes = all_meals()

  erb :'/recipe/index', locals: { recipes: all_recipes }
end

# to display the data i.e. create form
get '/recipe/create' do
  erb :'/recipe/create'
end 

# to post the data to the server
post '/recipe/create' do

  meal_item = params[:meal_item]
  calories = params[:calories]
  ingredients = params[:ingredients]
  recipe = params[:recipe]
  category = params[:category]
  image_url = params[:image_url]

  # if(category == "Breakfast" || category == "AM Snack" || category == "Lunch" || category == "PM Snack" || category == "Dinner") 
    create_recipe(meal_item, calories, ingredients, recipe, category, image_url)
  # else
  #   return "Incorrect category, please select one from the list and resubmit."
  # end

  redirect '/'
end


# Display individual food
get '/recipe/:id' do |id|  #:id looks for what the url looks like; 'id' is the sinatra route parameter and the colon infront means 'treat id as a variable that will adapt to whatever you pass through' i.e. if route is /food/1 then it sets a variable id = 1

  results = run_sql("SELECT * FROM meal_planning WHERE id = $1;", [id])
  
  erb :'/recipe/each_recipe', locals: { each_recipe: results[0] }
end

# Edit and display the updated individual food
get '/recipe/:id/edit' do |id|
  # look up food by id and pass it to the template
  results = run_sql("SELECT * FROM meal_planning WHERE id = $1;", [id])

  erb :'/recipe/edit', locals: { recipe: results[0] }
end


# Update individual recipe
put '/recipe/:id' do |id|
  # Run an update query - get the paramters and run and update sql query

  id = params[:id]
  meal_item = params[:meal_item]
  calories = params[:calories]
  ingredients = params[:ingredients]
  recipe = params[:recipe]
  category = params[:category]
  image_url = params[:image_url]

  # Run an update SQL query
  params =[meal_item, calories, ingredients, recipe, category, image_url, id]
  sql_query = "UPDATE meal_planning SET meal_item =$1, calories =$2, ingredients =$3, recipe =$4, category =$5, image_url =$6 WHERE id =$7;"

  run_sql(sql_query, params)

  redirect "/recipe/#{id}"
end

get '/breakfasts' do

  breakfast_recipes = breakfast_recipes()

  erb :'/recipe/breakfast', locals: { breakfasts: breakfast_recipes }
end

get '/am_snacks' do

  am_snack_recipes = am_snack_recipes()

  erb :'/recipe/am_snacks', locals: { am_snacks: am_snack_recipes }
end


get '/lunches' do

  lunches_recipes = lunch_recipes()

  erb :'/recipe/lunch', locals: { lunches: lunches_recipes }
end

get '/pm_snacks' do

  pm_snack_recipes = pm_snack_recipes()

  erb :'/recipe/pm_snacks', locals: { pm_snacks: pm_snack_recipes }
end

get '/dinners' do

  dinners_recipes = dinner_recipes()

  erb :'/recipe/dinner', locals: { dinners: dinners_recipes }
end

# Delete individual recipe
delete '/recipe/:id' do |id|

  # run a delete sql query
  sql_query = "DELETE FROM meal_planning WHERE id =$1;"
  params = [id]

  run_sql(sql_query, params)

  redirect "/"
end