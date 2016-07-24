# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

require 'colourize.rb'

require_relative './seed_data/categories'
require_relative './seed_data/subcategories'

categories = SeedData::Categories.all
subcategories = SeedData::Subcategories.all

NUM_OF_USERS = 3
NUM_OF_CATEGORIES = 6
NUM_OF_ARTICLES = 20

puts "Starting to Seed Database. This takes a minute.".yellow
puts "================================================".yellow
puts "Removing current entries in database".blue

[ArticleBlock, Subcategory, Categorization, EquationBlockVariable, Image,
  Category, Article, Contributor, User].map(&:destroy_all)

puts ""
puts "Starting to create Categories and their Subcategories into database".yellow
puts "================================================".yellow
NUM_OF_CATEGORIES.times do |x|
  puts "Iteration #{x+1} of #{NUM_OF_CATEGORIES}".green
  puts "================================================".yellow
  category = Category.create!(categories.at(x))
  puts "Creating #{category.name} and the associated subcategories".blue
  category.subcategories.create!(subcategories.at(x))
  puts "================================================".yellow
end

puts ""
puts "Starting to create #{NUM_OF_USERS} users".yellow
(NUM_OF_USERS - 1).times do |x|
  puts "Iteration #{x+1} of #{NUM_OF_USERS}".green
  puts "================================================".yellow
  user = User.create!(:email => Faker::Internet.email, :password => Faker::Internet.password(7))
  puts "Creating a user with the email: #{user.email} and the password: #{user.password}".blue
  puts "================================================".yellow
end
active_user = User.new(email: 'a@a.a', password: '123456')
active_user.skip_confirmation!
active_user.save!

puts ""
puts "Starting to create #{NUM_OF_ARTICLES} articles".yellow
NUM_OF_ARTICLES.times do |x|
  puts "Iteration #{x+1} of #{NUM_OF_ARTICLES}".green
  puts "================================================".yellow
  article = Article.create!(:title => Faker::Beer.name)
  puts "Creating an article with the title: #{article.title}".blue
  article.create_text_block(:body => Faker::Lorem.sentence(x))
  puts "Creating an article text block containing a random paragraph".blue
  article.create_image_block(:image => Image.create!(:remote_body_url => "https://unsplash.it/400/400/?random"))
  puts "Creating an article image block containing a random image".blue
  contrib = Contributor.create!(article: article, user: User.order("RAND()").first)
  puts "Creating an article equation block containing E=mc^2".blue
  equation_block = article.create_equation_block(:equation => "E=mc^2", :label => "Sample Equation")
  puts "Creating article equation variable blocks for the equation block containing E=mc^2".blue
  EquationBlockVariable.create!(:variable => "E", :description => "Kinetic Energy", article_equation_block: equation_block)
  EquationBlockVariable.create!(:variable => "m", :description => "Mass", article_equation_block: equation_block)
  EquationBlockVariable.create!(:variable => "c", :description => "Speed of Light", article_equation_block: equation_block)
  puts "Creating a contributor with article: #{article.title} and user: #{contrib.user.email}".blue
  categorization = Categorization.create!(article: article, subcategory: Subcategory.order("RAND()").first)
  puts "Creating a categorization between article: #{article.title} and subcategory: #{categorization.subcategory.name}".blue
  puts "================================================".yellow
end

puts "SUCCESS. You can now log in at /sign_in with the credentials: 'a@a.a' with the password: '123456' (no quotes)".green
