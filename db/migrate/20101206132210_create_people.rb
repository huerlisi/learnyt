class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :type
      t.date :date_of_birth
      t.date :date_of_death
      t.integer :sex

      t.timestamps
    end

    add_column :users, :person_id, :integer
  end

  def self.down
    remove_column :users, :person_id
    
    drop_table :people
  end
end
