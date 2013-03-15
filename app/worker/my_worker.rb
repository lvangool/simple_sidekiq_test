# The worker
class MyWorker

	include Sidekiq::Worker
	SECONDS = 30

	def perform
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "#{Time.now.strftime('%I:%M:%S %z')} Picked up (#{ENV['RAILS_ENV']}) -> going to sleep for #{SECONDS} seconds"
		end
		sleep 10
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "#{Time.now.strftime('%I:%M:%S %z')} Woken up -> rescheduling"
		end
		MyWorker.perform_async
	end
end
