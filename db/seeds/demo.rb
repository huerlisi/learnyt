# Demo Seed
# =========
admin = User.create({:email => 'admin@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
admin.roles.create(:name => 'admin')

teacher = User.create({:email => 'teacher@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
teacher.roles.create(:name => 'teacher')

pupil = User.create({:email => 'pupil@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
pupil.roles.create(:name => 'pupil')
