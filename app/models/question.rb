class Question < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
