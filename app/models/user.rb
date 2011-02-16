class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :locked_at

  # Authorization roles
  has_and_belongs_to_many :roles, :autosave => true
  scope :by_role, lambda{|role| include(:roles).where(:name => role)}
  attr_accessible :role_texts
  
  # Return current role name.
  def role_name
    # Just return _a_ role, no preferences or guarantees...
    roles.last.name
  end
  
  def role?(role)
    !!self.roles.find_by_name(role.to_s)
  end

  def role_texts
    roles.map{|role| role.name}
  end
  
  def role_texts=(role_names)
    self.roles = Role.where(:name => role_names)
  end
  
  # Person
  belongs_to :person
  attr_accessible :person_attributes
  accepts_nested_attributes_for :person
  validates_presence_of :person
  
  # Tags
  acts_as_taggable
  attr_accessible :tag_list

  # Helpers
  def to_s
    person.try(:to_s) || email
  end
end
