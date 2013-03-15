# The worker
class MyWorker

	include Sidekiq::Worker
	SECONDS = 300

	def perform
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "#{Time.now.strftime('%I:%M:%S %z')} Picked up (#{ENV['RAILS_ENV']}) -> going to sleep for #{SECONDS} seconds"
		end
		sleep SECONDS
		f2.puts "#{Time.now.strftime('%I:%M:%S %z')} Woken up (#{ENV['RAILS_ENV']}) -> going to reschedule"
		MyWorker.perform_async
	end
end
