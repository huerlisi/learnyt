class AddRemarksToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :remarks, :text
  end

  def self.down
    remove_column :people, :remarks
  end
end
