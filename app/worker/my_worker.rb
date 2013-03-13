# The worker
class MyWorker
	include Sidekiq::Worker
	def perform
		File.open("/tmp/sidekiq_test_output.txt", 'a+') do |f2|
			f2.puts "got hit"
		end

	end
end