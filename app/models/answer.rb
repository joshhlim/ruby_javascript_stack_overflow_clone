class Answer < ActiveRecord::Base
  scope :top, ->(){ order('votes_count DESC') }
  validates :body, presence: true
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
