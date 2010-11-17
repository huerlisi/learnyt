class AddObjectToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :object_id, :integer
    add_column :events, :object_type, :string
  end

  def self.down
    remove_column :events, :object_id
    remove_column :events, :object_type
  end
end
