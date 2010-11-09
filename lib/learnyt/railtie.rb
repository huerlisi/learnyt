require 'learnyt'
require 'rails'

module Learnyt
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/learnyt.rake"
    end
  end
end
