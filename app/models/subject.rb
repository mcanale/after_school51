class Subject < ActiveRecord::Base
  
  has_and_belongs_to_many :presences
 
  validates :name, presence: true, uniqueness: true
end
