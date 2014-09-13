class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :course_id
      t.boolean :awaited_Mon
      t.boolean :awaited_Tue
      t.boolean :awaited_Wed
      t.boolean :awaited_Thu
      t.boolean :awaited_Fri
      t.boolean :awaited_Sat
      t.boolean :awaited_Sun

      t.timestamps
    end
  end
end
