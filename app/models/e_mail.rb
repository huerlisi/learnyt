class EMail < ActiveRecord::Base
  has_many :recipients
  has_many :users, :through => :recipients
  accepts_nested_attributes_for :recipients

  belongs_to :sender, :class_name => "User", :foreign_key => "user_id"

  validates_presence_of :sender, :title, :body, :users

  after_create :send_parents_e_mails

  def send?
    self.send_at != nil ? true : false
  end

  private
  def send_parents_e_mails
    users.each do |user|
      mail = UserEMail.parents_mail(sender.email, title, body, user)
      mail.deliver
    end
    self.send_at = Time.zone.now
    self.save
  end
end
