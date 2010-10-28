class AddQuizIdToResponses < ActiveRecord::Migration
  def self.up
    add_column :responses, :quiz_id, :integer
  end

  def self.down
    remove_column :responses, :quiz_id
  end
end
