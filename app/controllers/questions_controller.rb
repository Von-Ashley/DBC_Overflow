get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end



get '/questions/new' do
  if logged_in?
    erb :'/questions/new'
  else
    # alert("Please you have to login to post a question")
    redirect to '/questions'
  end

end

post '/questions' do
    @question = Question.new(params[:question])
  if @question.save
    redirect to '/questions'
  else
    erb :'questions/new'
  end

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @answers = @question.answers
  
  erb :'/questions/show'
end

post '/answers/:id' do
  @question = Question.find(params[:id])
  params[:answer][:answer]
  @question.answers.create(user_id: session[:user_id], answer: params[:answer][:answer])

  redirect to "/questions/#{@question.id}"
end



