namespace :viddashboard do
  desc 'Creating initial user'
  task :create_user => :environment do
    user = User.new(
        :email                 => "admin@contentdistrict.io",
        :password              => "Rhenjqgfhjkm1",
        :password_confirmation => "Rhenjqgfhjkm1"
    )
    user.save!
  end
end
