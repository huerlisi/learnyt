# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :person do |f|
  f.type "MyString"
  f.date_of_birth "2010-12-06"
  f.date_of_death "2010-12-06"
  f.sex 1
end
