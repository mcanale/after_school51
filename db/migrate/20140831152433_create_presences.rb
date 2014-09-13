
class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.belongs_to :student
      t.date :date
      t.boolean :absent
      t.belongs_to :user
     # t.integer :subject_ids
      t.string :note

      t.timestamps
    end
    add_index :presences, :date
  end

  create_table :presences_subjects, id: false do |t|
      t.belongs_to :presence
      t.belongs_to :subject
  end

end
