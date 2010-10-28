class RenameQuizIdToQuizResponseInResponses < ActiveRecord::Migration
  def self.up
    rename_column :responses, :quiz_id, :quize_response_id
  end

  def self.down
    rename_column :responses, :quiz_response_id, :quize_id
  end
end
