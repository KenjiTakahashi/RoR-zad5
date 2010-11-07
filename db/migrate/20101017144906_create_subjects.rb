class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |s|
      s.column :student_id, :integer
      s.column :name, :text
    end
  end

  def self.down
    drop_table :subjects
  end
end
