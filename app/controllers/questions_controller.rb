get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = @question.comments
  @answers = @question.answers
  

  erb :'/questions/show'

end
