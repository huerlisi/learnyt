class CreateQuizResponses < ActiveRecord::Migration
  def self.up
    create_table :quiz_responses do |t|
      t.integer :quiz_id
      t.integer :response_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_responses
  end
end
