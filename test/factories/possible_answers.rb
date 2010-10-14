# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :possible_answer do |f|
  f.question_id 1
  f.answer_id 1
  f.score "9.99"
  f.position 1
end
