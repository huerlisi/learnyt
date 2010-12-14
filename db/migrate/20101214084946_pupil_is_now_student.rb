class PupilIsNowStudent < ActiveRecord::Migration
  def self.up
    execute "UPDATE roles SET name = 'student' WHERE name = 'pupil'"
  end

  def self.down
    execute "UPDATE roles SET name = 'pupil' WHERE name = 'student'"
  end
end
