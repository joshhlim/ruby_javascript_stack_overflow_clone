class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions
  validates :name, { presence: true, uniqueness: true }
end
