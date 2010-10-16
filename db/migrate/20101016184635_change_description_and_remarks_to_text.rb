class ChangeDescriptionAndRemarksToText < ActiveRecord::Migration
  def self.up
    change_column :answers, :description, :text
    change_column :answers, :remarks, :text

    change_column :questions, :description, :text
    change_column :questions, :remarks, :text
  end

  def self.down
    change_column :answers, :description, :string
    change_column :answers, :remarks, :string

    change_column :questions, :description, :string
    change_column :questions, :remarks, :string
  end
end
