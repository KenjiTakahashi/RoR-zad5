class Student < ActiveRecord::Base
  before_save :cipher
  validates_presence_of :name, :surname
  has_many :subjects, :dependent => :destroy
  belongs_to :year
  after_find :decipher
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
