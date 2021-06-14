get '/user' do
  erb :'/users/new'
end

put '/user' do
  email = params[:email]
  password = params[:password_digest]

  create_user(email, password)

  redirect '/'
end