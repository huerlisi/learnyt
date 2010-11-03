class RemoveUserFromRepsonse < ActiveRecord::Migration
  def self.up
    remove_column :responses, :user_id
  end

  def self.down
    add_column :responses, :user_id, :integer
  end
end
