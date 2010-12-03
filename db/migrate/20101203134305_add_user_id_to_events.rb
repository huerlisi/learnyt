class AddUserIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :user_id, :integer
    
    Event.all.map{|event|
      event.user_id = event.object.try(:user_id) if event.object
    }
  end

  def self.down
    remove_column :events, :user_id
  end
end
