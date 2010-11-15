# Role factories
Factory.define :admin, :class => Role do |f|
  f.name "admin"
end

Factory.define :teacher, :class => Role do |f|
  f.name "teacher"
end

Factory.define :pupil, :class => Role do |f|
  f.name "pupil"
end
