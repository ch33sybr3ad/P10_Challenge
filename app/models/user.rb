class User < ActiveRecord::Base

  has_many :relationships
  has_many :jobs, through: :relationships

end