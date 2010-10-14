class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :title
      t.string :description
      t.string :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
