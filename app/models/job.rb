class Job < ActiveRecord::Base

  has_many :relationships
  has_many :users, through: :relationships

  # validates_uniqueness_of :jobkey

end