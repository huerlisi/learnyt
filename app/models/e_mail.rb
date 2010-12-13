class EMail < ActiveRecord::Base
  has_many :recipients
  has_many :users, :through => :recipients
  accepts_nested_attributes_for :recipients

  belongs_to :sender, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :sender, :title, :body, :users
end
