# The worker
class MyWorker
	include Sidekiq::Worker
	def perform
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "#{Time.now.strftime('%I:%M:%S %z')} SAMPLE_ENV='#{ENV['SAMPLE_ENV']}'"
		end
		MyWorker.perform_in(5.seconds)
	end
end