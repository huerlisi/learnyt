class EMail < ActiveRecord::Base
  has_many :recipients
end
