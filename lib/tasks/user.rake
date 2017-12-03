namespace :user do
  desc 'Assign a role to a user by email address'
  task :assign_role, [:email_address, :role] => :environment do |_t, args|
    email = args[:email_address]
    role = args[:role]
    user = User.find_by(email: email)
    user.update(role: role)
  end
end
