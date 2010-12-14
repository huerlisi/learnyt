# Demo Seed
# =========
admin_vcard = Vcard.new(:given_name => 'Peter', :family_name => 'Admin', :street_address => 'Freedomroad 19', :postal_code => '9999', :locality => 'Capital')
admin_person = Person.new(:vcard => admin_vcard, :sex => Person::MALE)
admin = User.new({:email => 'admin@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
admin.person = admin_person
admin.roles.build(:name => 'admin')
admin.save

teacher_vcard = Vcard.new(:given_name => 'Frank', :family_name => 'Teacher', :street_address => 'Learning Av. 20', :postal_code => '9999', :locality => 'Capital')
teacher_person = Person.new(:vcard => teacher_vcard, :sex => Person::MALE)
teacher = User.new({:email => 'teacher@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
teacher.person = teacher_person
teacher.roles.build(:name => 'teacher')
teacher.save

student_vcard = Vcard.new(:given_name => 'Anne', :family_name => 'Student', :street_address => 'Learning Av. 19', :postal_code => '9999', :locality => 'Capital')
student_person = Person.new(:vcard => student_vcard, :sex => Person::FEMALE)
student = User.new({:email => 'student@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
student.person = student_person
student.roles.build(:name => 'student')
student.save
