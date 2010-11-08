require 'machinist/active_record'

Student.blueprint do
  name { "Name #{sn}" }
  surname { "Surname #{sn}" }
end
