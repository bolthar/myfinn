
namespace :myfinn do

  task :admin => :environment do
    user = create_user(true)
    print "New admin '#{user.name}' created (email: #{user.email}, password: #{ENV['password']})\n"
  end

  task :user => :environment do
    user = create_user(false)
    print "New user '#{user.name}' created (email: #{user.email}, password: #{ENV['password']})\n"
  end

  task :poll => :environment do
    parser = Parser.new
    apartments = parser.parse_all_page(Rails.application.config.insertion_filter_url)
    apartments.each do |apt|
      if apt.new_record?
        apt.save
        insertion = Insertion.new
        insertion.apartment = apt
        insertion.save
      end
    end
  end

  task :notify => :environment do
    not_notified = Insertion.where("notified = false")
    if(not_notified.count >= Rails.application.config.insertion_notification_threshold)
      notify_new_insertions(not_notified.count)
      not_notified.each do |ins|
        ins.notified = true
        ins.save
      end
    end
  end

  def notify_new_insertions(insertions)
    #twilio
    account_sid = Rails.application.config.twilio_account_sid
    auth_token = Rails.application.config.twilio_auth_token
    from_no = Rails.application.config.twilio_source_number
    to_no = Rails.application.config.twilio_target_number

    no_of_insertions = insertions.count
    max_insertion_size = insertions.max { |x| x.size }
    min_insertion_size = insertions.max { |x| x.size }
    max_insertion_price = insertions.min { |x| x.price }
    min_insertion_price = insertions.max { |x| x.price }

    message = "MyFinn watcher - #{no_of_insertions} new insertions of interests, from #{min_insertion_size} to #{max_insertion_size} m2, from #{min_insertion_price} to #{max_insertion_price} NOK"
      
    client = Twilio::REST::Client.new(account_sid, auth_token)
    account = client.account
    account.sms.messages.create({:from => from_no, :to => to_no, :body => 'Test message'})
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
