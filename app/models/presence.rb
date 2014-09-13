class Presence < ActiveRecord::Base
  belongs_to :student
  has_one :course, through: :student
  belongs_to :user

  has_and_belongs_to_many :subjects

  validates :student_id, presence: true
  validates :date, presence: true
  validates :student_id, uniqueness: { scope: :date, message: "should happen once per day" }
  validates :user_id, presence: true
end
