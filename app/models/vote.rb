class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:voteable_type, :voteable_id]
end
