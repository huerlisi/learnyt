class Recipient < ActiveRecord::Base
  belongs_to :e_mail
  belongs_to :user
end
