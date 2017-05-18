class Question < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :comments, as: :commentable
end




def self.search_question(searched_words)
  searched_words.each do |search|
    matches = Question.all.select { |q| q.title.include?(search)}
  end
end


# all_questions.select {|q| q.title.include?("babby") }
