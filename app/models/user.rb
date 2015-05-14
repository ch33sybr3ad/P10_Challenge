class User < ActiveRecord::Base

  has_many :relationships
  has_many :jobs, through: :relationships

   validates_uniqueness_of :username

end