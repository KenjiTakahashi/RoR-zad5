class AddYearIdToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :year_id, :integer
  end

  def self.down
    remove_column :students, :year_id
  end
end
