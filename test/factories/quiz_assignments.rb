# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :quiz_assignment do |f|
  f.user_id 1
  f.due_at "2010-11-05 15:40:06"
end
