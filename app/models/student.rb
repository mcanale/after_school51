class Student < ActiveRecord::Base
  belongs_to :course

  has_many :presences
  has_many :users, through: :presences

  validates :name, presence: true
  validates :surname, presence: true
  validates :course_id, presence: true
end
