class Person < ActiveRecord::Base
  # sex enumeration
  MALE   = 1
  FEMALE = 2

  # Associations
  has_many :vcards, :as => :object
  has_one :vcard, :as => :object

  accepts_nested_attributes_for :vcard

  # Validations
  validates_date :date_of_birth, :date_of_death, :allow_nil => true, :allow_blank => true
  validates_presence_of :vcard

  def self.gender
    [[I18n.t('activerecord.values.person.male'), MALE], [I18n.t('activerecord.values.person.female'), FEMALE]]
  end

  # Constructor  
  def initialize(attributes = nil)
    super

    build_vcard unless vcard
    vcard.build_address unless vcard.address
  end

  # Helpers
  def to_s
    "%s (%s)" % [vcard.try(:full_name), vcard.try(:locality)]
  end

  def sex_to_s
    sex.eql?MALE ? I18n.t('activerecord.values.person.male') : I18n.t('activerecord.values.person.female')
  end

  # Tags
  acts_as_taggable

  # User/Account
  has_one :user
end
