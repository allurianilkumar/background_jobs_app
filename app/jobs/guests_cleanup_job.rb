class GuestsCleanupJob
  # include Sidekiq::Job
  #include Sidekiq::Worker
  # queue_as :low_priority
  # queue_as :default

  # before_enqueue do |job|
  #   # do something with the job instance
  # end

  # around_perform do |job, block|
  #   # do something before perform
  #   block.call
  #   # do something after perform
  # end

  # def perform(*args)
  #   puts "perform: This is Guests Cleanup job "
  #   puts "1:#{args[0]}"
  #   puts "2:#{args[1]}"
  # end
  #
  #
  include Sidekiq::Worker
 sidekiq_options :queue => :default , :retry => 1
def perform(type)
  case type
  when 'easy'
   sleep 5
   puts 'this is easy job 5 sec wait'
  when 'medium'
   sleep 20
   puts 'this is medium job 20 sec wait'
  when 'hard'
   sleep 30
   puts 'this is hard job 30 sec wait'
  when 'error'
   sleep 15
   puts 'there is a error, wait for 15 sec'
   raise 'raised error'
  end
 end
end
