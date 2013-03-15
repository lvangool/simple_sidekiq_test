# The worker
class MyWorker
	include Sidekiq::Worker
	def perform
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "#{Time.now.strftime('%I:%M:%S %z')} SAMPLE_ENV='#{ENV['SAMPLE_ENV']}'"
			f2.puts "sleeping for 10 seconds"
			sleep 10
			f2.puts "Woken up, rescheduling"
		end		
		MyWorker.perform_async
	end
end