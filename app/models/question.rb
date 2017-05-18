class Question < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def self.search_question(searched_words)
    matches = []
    searched_words.each do |search|
      Question.all.select { |q| matches << q if q.title.include?(search)}
    end
    matches.uniq
  end
end






# all_questions.select {|q| q.title.include?("babby") }
