# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'colourize.rb'

NUM_OF_ITERATIONS = 6

puts "Starting to Seed Database. This takes a minute.".yellow
puts "================================================".yellow
puts "Removing current entries in database".blue

[Category, Article, User, Contributor, ArticleBlock, Subcategory, Categorization, Session, Image].map(&:destroy_all)

categories = [
  {
    name: "Electricity",
    description: "Description for Electricity & Magnetism",
    # remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Fundamentals",
    description: "Description for Fundamentals",
    # remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Optics",
    description: "Description for Optics",
    # remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Quantum",
    description: "Description for Quantum Physics",
    # remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Statistical",
    description: "Description for Statistical Physics",
    # remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Thermodynamics",
    description: "Description for Thermodynamics",
    # remote_image_url: "http://lorempixel.com/200/200/",
  }
]

puts ""
puts "Starting to create new entries into database".yellow
puts "================================================".yellow
NUM_OF_ITERATIONS.times do |x|
  puts "Iteration #{x+1} of #{NUM_OF_ITERATIONS}".green
  puts "================================================".yellow
  category = Category.create(categories.at(x))
  puts "Creating category with the name: '#{category.name}', Description: '#{category.description}' and an image".blue
  subcategory = Subcategory.create(:name => Faker::StarWars.planet, :description => Faker::StarWars.quote, category: category)
  puts "Creating subcategory with the name: #{subcategory.name}, description: #{subcategory.description} and belongs to the category #{category.name}".blue
  article = Article.create(:title => Faker::Beer.name)
  puts "Creating an article with the title: #{article.title}".blue
  article.create_text_block(:body => Faker::Lorem.sentence(x))
  puts "Creating an article text block containing a random paragraph".blue
  article.create_image_block(:image => Image.create(:remote_body_url => "http://lorempixel.com/400/400/"))
  puts "Creating an article image block containing a random image".blue
  article.create_equation_block(:equation => "E=mc^2", :label => "Sample Equation")
  puts "Creating an article equation block containg the equation E=mc^2".blue
  user = User.create(:email => Faker::Internet.email, :password => Faker::Internet.password(7))
  puts "Creating a user with the email: #{user.email} and the password: #{user.password}".blue
  Contributor.create(article: article, user: user)
  puts "Creating a contributor with article #{article.title} and #{user.email}".blue
  Categorization.create(article: article, subcategory: subcategory)
  puts "Creating a categorization between #{article.title} and #{subcategory.name}".blue
  puts "================================================".yellow
end
