# meal planning app
# create an app with multiple page accesses:
  # meal planning main page which displays each day in the week and in opening each day, it displays breakfast, lunch, snacks and dinner (picture and title)
    # database table; columns are id, day, breakfast, am snack, lunch, pm snack, dinner
    # main rb page that opens up to the week planning page
    # layout to include the consistent page access links to:
      # - week planning
      # - recipe library
      # - wishlist shopping list
  # click on each meal takes you to the recipe library - where the user puts in the ingredients, instructions and calorie intake
    # database table; columns are id, meals, calories, ingredients, recipes
  # opening each ingredient, automatically adds it to the wishlist shopping list and leads user to product on Woolworths/Coles website
    # database table; columns are id, ingredients, woolies/coles links
  # BONUS - display the total calorie intake under each day in the week meal planning page

require 'sinatra'
require 'sinatra/reloader'
require 'pg'

require_relative 'db/db'

require_relative 'models/recipes'
require_relative 'models/user'

require_relative 'helpers/sessions_helper'

require_relative 'controllers/recipe_controller' #require_relative only works for an rb file not erb
require_relative 'controllers/users_controller' 
require_relative 'controllers/sessions_controller'
