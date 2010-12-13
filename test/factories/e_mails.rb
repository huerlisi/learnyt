# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :e_mail do |f|
  f.user_id 1
  f.title "MyString"
  f.body "MyText"
  f.recipients_id 1
end
