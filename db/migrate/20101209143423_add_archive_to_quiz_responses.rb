class AddArchiveToQuizResponses < ActiveRecord::Migration
  def self.up
    add_column :quiz_responses, :archive, :boolean, :default => false
  end

  def self.down
    remove_column :quiz_responses, :archive
  end
end
