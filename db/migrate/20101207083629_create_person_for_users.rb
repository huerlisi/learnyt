class CreatePersonForUsers < ActiveRecord::Migration
  def self.up
    users = User.where(:person_id => nil).all
    
    users.map{|user|
      user.create_person
      user.save
    }
  end

  def self.down
  end
end
