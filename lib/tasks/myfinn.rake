
namespace :myfinn do

  task :admin => :environment do
    user = create_user(true)
    print "New admin '#{user.name}' created (email: #{user.email}, password: #{ENV['password']})\n"
  end

  task :user => :environment do
    user = create_user(false)
    print "New user '#{user.name}' created (email: #{user.email}, password: #{ENV['password']})\n"
  end

  def create_user(is_admin)
    name  = ENV['name'].dup
    email = ENV['email'].dup
    pass  = ENV['password'].dup
    user  = User.new
    user.name = name
    user.email = email
    user.password = pass
    user.password_confirmation = pass
    user.admin = is_admin
    if user.save
      return user
    else 
      raise "Error during user creation"
    end
  end
end
