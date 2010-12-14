class AddSendAtToEMail < ActiveRecord::Migration
  def self.up
    add_column :e_mails, :send_at, :datetime
  end

  def self.down
    remove_column :e_mails, :send_at
  end
end
