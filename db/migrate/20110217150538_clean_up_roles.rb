class CleanUpRoles < ActiveRecord::Migration
  def self.up
    admins = User.all.select{|user| user.role?('admin')}
    students = User.all.select{|user| user.role?('student')}
    teachers = User.all.select{|user| user.role?('teacher')}

    Role.delete_all
    execute "DELETE FROM roles_users"

    admin = Role.create(:name => 'admin')
    student = Role.create(:name => 'student')
    teacher = Role.create(:name => 'teacher')

    admins.map{|user| user.roles << admin; user.save}
    students.map{|user| user.roles << student; user.save}
    teachers.map{|user| user.roles << teacher; user.save}
  end

  def self.down
  end
end
