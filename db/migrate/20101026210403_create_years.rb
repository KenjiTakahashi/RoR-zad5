class CreateYears < ActiveRecord::Migration
  def self.up
    create_table :years do |y|
      y.string :year
      y.timestamps
    end
  end

  def self.down
    drop_table :years
  end
end
