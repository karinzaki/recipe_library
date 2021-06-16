# A database function
def run_sql (sql_query, params = [])
  # connection = PG.connect(dbname: 'recipe_library')

  # Heroku connecting to its database and we're connecting to our local database
  # ENV - is a variable an evironment variable - see .zshrc; don't type APIKEY, use the ENV['APIKEY variable']
  connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'recipe_library'})

  connection.prepare('statement_name', sql_query)
  results = connection.exec_prepared('statement_name', params)
  connection.close

  return results
end

