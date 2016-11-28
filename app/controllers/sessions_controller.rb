get '/login' do
  erb :'sessions/login'
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    login(@user)
    redirect to "/users/#{@user.id}"
  else
		redirect to '/login'
  end

end

get '/logout' do
  logout!
  redirect to '/users'
end
