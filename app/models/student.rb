class Student < ActiveRecord::Base
  before_save :cipher
  validates_presence_of :name, :surname
  has_many :subjects, :dependent => :destroy
  belongs_to :year
  def after_find
    # "They" say it's slow, so "for testing purposes only ;)"
    decipher
  end
private
  def cipher
    begin
      self.surname = surname.split('').collect! {|letter| (letter[0].ord + 3).chr}.join
    rescue RangeError
    end
  end
  def decipher
    begin
      self.surname = surname.split('').collect! {|letter| (letter[0].ord - 3).chr}.join
    rescue RangeError
    end
  end
end
