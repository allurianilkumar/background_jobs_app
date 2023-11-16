# Processing Background Jobs Using Sidekiq Gem in Rails 7

# What is Sidekiq?

Sidekiq is a popular background job processing library for Ruby on Rails applications. It provides a simple and efficient way to offload time-consuming tasks, as mentioned above, from the main request-response cycle of a Rails application.

# Redis

Sidekiq uses Redis, an in memory data store, to store jobs that are processed by the worker.

# Client

It is the Ruby or Rails process that creates jobs that are processed in the background.

# Server

This is responsible for running jobs by pulling them from the Redis queue.

# rails new sidekiq_tutorial

# bundle add sidekiq

# rails generate sidekiq:job my_first_job

# update app/sidekiq/my_first_job.rb

def perform(name,age)
puts "I am #{name}, running my first job at #{age}"
#any other valid Ruby/Rails code goes here!
end

# Redis Configurations

config/initializers/.env

REDIS_URL=redis://redis.example.com:7372/0

config/initializers/sidekiq.rb

# config/routes.rb

require 'sidekiq/web'

Myapp::Application.routes.draw do

# mount Sidekiq::Web in your Rails app

mount Sidekiq::Web => "/sidekiq"
end
