class Question < ActiveRecord::Base
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :user
  has_one :best_answer, class_name: 'Answer'
  # Remember to create a migration!
end
