require 'faker'

User.delete_all
Answer.delete_all
Question.delete_all
Comment.delete_all
Vote.delete_all

50.times do
  User.create!( :full_name  => Faker::Name.name,
                :email      => Faker::Internet.email,
                :password   => 'password'
              )
end

50.times do
  Question.create!( 
    user_id:      User.all.sample.id,
    title:        Faker::Lorem.sentence,
    question:     Faker::Lorem.paragraph,
    answer_id:    rand(1...50)
    )
end

answers = []

50.times{ answers << Faker::Lorem.paragraph}
100.times do
  Answer.create!( 
    user_id:      User.all.sample.id,
    question_id:  Question.all.sample.id,
    answer:       answers.sample 
    )
end


question_answer = Question.all
Answer.all.each {|a| question_answer << a }

250.times do
  sample = question_answer.sample
  Comment.create!( 
    user_id:      User.all.sample.id,
    comment:      Faker::Lorem.paragraph,
    commentable_id:  sample.id,
    commentable_type: sample.class
    )
end

150.times do
  sample = question_answer.sample
  Vote.create!( 
    user_id:      User.all.sample.id,
    votable_id:   sample.id,
    votable_type: sample.class
  )
end



