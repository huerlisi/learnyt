class CreateRolesPeopleTable < ActiveRecord::Migration
  def self.up
    create_table :roles_people, :id => false do |t|
      t.references :role, :polymorphic => true
      t.references :person
    end
  end

  def self.down
    drop_table :roles_people
  end
end
