# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Clear existing data
Message.destroy_all
Channel.destroy_all
User.destroy_all

# Create users
user1 = User.create!(username: 'Alice', email: 'alice@example.com', password: 'password')
user2 = User.create!(username: 'Bob', email: 'bob@example.com', password: 'password')
user3 = User.create!(username: 'Charlie', email: 'charlie@example.com', password: 'password')

# Create channels
channel1 = Channel.create!(name: 'General', desc: 'This is General Chat')
channel2 = Channel.create!(name: 'Random', desc: 'This is More fun channel')
channel3 = Channel.create!(name: 'Tech Talk', desc: 'This is Tech Talk')
channel4 = Channel.create!(name: 'News', desc: 'This is News')

# Create messages
Message.create!(content: 'Hello everyone!', user: user1, channel: channel1)
Message.create!(content: 'Welcome to the General channel', user: user2, channel: channel1)
Message.create!(content: 'Did you see the latest news?', user: user3, channel: channel4)
Message.create!(content: 'This is a random message', user: user1, channel: channel2)
Message.create!(content: 'Anyone here interested in Ruby on Rails?', user: user2, channel: channel3)
Message.create!(content: 'React.js is awesome!', user: user3, channel: channel3)

puts "Seed data created successfully!"
