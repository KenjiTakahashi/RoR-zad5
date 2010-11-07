class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |s|
      s.column :name, :text
      s.column :surname, :text
    end
  end

  def self.down
    drop_table :students
  end
end
