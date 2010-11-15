# User factories
require File.expand_path('../roles', __FILE__)

Factory.define :admin_user, :class => User do |f|
  f.email    "admin@example.com"
  f.password "admin1234"
  f.roles [Factory.build(:admin)]
end
