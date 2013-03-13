namespace :tester do
	task :test => :environment do |args|
		puts "RAILS_ENV=#{ENV['RAILS_ENV']}"
	end
end
