class CreateEMails < ActiveRecord::Migration
  def self.up
    create_table :e_mails do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :recipients_id

      t.timestamps
    end
  end

  def self.down
    drop_table :e_mails
  end
end
