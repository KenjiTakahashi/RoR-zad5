class Subject < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :student
end
