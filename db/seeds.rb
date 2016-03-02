# Setup one user per role

[ {email: 'superadmin@test.com', password: 'password', role: 4},
  {email: 'admin@test.com',      password: 'password', role: 3},
  {email: 'overdue@test.com',    password: 'password', role: 2},
  {email: 'paid@test.com',       password: 'password', role: 1},
  {email: 'free@test.com',       password: 'password', role: 0}
].each do |attributes|
  user = User.new attributes
  user.skip_confirmation!
  user.save!
end
