#get all users
get '/users'  do
	@users = User.all
	erb :'users/index'
end

#new user
get '/users/new' do

  erb :'users/new'
end

#form for creating user
post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  
  if @user.save
    session[:user_id] = @user.id
    redirect to '/users'
  else
    erb :'users/new'
  end

end

#show one user
get '/users/:id' do
  if session[:user_id] == params[:id].to_i
    @user = User.find(params[:id])
    erb :'users/show'
  else
    redirect to '/users'
  end
end

#edit a user
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

#update the user
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])

  erb :"users/#{user.id}"
end

#delete a user
delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy

  redirect to '/users'
end

