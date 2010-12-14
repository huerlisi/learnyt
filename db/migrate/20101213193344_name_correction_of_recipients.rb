class NameCorrectionOfRecipients < ActiveRecord::Migration
  def self.up
    rename_column :recipients, :email_id, :e_mail_id
  end

  def self.down
    rename_column :recipients, :e_mail_id, :email_id
  end
end
