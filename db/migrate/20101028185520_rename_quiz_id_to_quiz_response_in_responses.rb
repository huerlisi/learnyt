class RenameQuizIdToQuizResponseInResponses < ActiveRecord::Migration
  def self.up
    rename_column :responses, :quiz_id, :quiz_response_id
  end

  def self.down
    rename_column :responses, :quiz_response_id, :quiz_id
  end
end
