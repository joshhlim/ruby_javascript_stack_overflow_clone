class Tag < ApplicationRecord
  has_many :tagquestions, class_name: :TagQuestion, foreign_key: :tag_id
  has_many :questions, through: :tagquestions

  def self.make_tags(arr, question)
    arr.each do |tag|
      tag = Tag.find_or_create_by(tag: tag)
      p question.id
      p tag.id
      TagQuestion.create(question_id: question.id, tag_id: tag.id)
    end
  end
end
