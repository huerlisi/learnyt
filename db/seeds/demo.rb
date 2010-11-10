# Demo Seed
# =========
user = User.create({:email => 'admin@example.com', :password => 'demo1234', :password_confirmation => 'demo1234'})
user.roles.create(:name => 'admin')
