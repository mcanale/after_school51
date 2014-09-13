class PresencesSubjects < ActiveRecord::Base
  #belongs_to :presences
  #belongs_to :subjects
  
  validates :presence_id, presence: true
  validates :subject_id, presence: true
  validates :presence_id, uniqueness: { scope: :subject_id }
end
