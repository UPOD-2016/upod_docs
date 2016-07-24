# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

require 'colourize.rb'

NUM_OF_USERS = 3
NUM_OF_CATEGORIES = 6
NUM_OF_ARTICLES = 20

puts "Starting to Seed Database. This takes a minute.".yellow
puts "================================================".yellow
puts "Removing current entries in database".blue

[Category, Article, User, Contributor, EquationBlockVariable, ArticleBlock, Subcategory, Categorization, Image].map(&:destroy_all)

categories = [
  {
    name: "Fundamentals",
    description: "Description for Electricity & Magnetism",
    remote_image_url: "https://unsplash.it/200/200/?random",
  },
  {
    name: "Classical Mechanics",
    description: "Description for Fundamentals",
    remote_image_url: "https://unsplash.it/200/200/?random",
  },
  {
    name: "Electricity and Magnetism",
    description: "Description for Optics",
    remote_image_url: "https://unsplash.it/200/200/?random",
  },
  {
    name: "Statistical Mechanics",
    description: "Description for Quantum Physics",
    remote_image_url: "https://unsplash.it/200/200/?random",
  },
  {
    name: "Optics",
    description: "Description for Statistical Physics",
    remote_image_url: "https://unsplash.it/200/200/?random",
  },
  {
    name: "Quantum Mechanics",
    description: "Description for Thermodynamics",
    remote_image_url: "https://unsplash.it/200/200/?random",
  }
]



subcategories = [ [
  {
    name: "Motion",
    description: "Description for Motion",
  },
  {
    name: "Forces",
    description: "Description for Forces",
  },
  {
    name: "Energy",
    description: "Description for Energy",
  },
  {
    name: "Work",
    description: "Description for Work",
  },
  {
    name: "Kelper's Laws",
    description: "Description for Kelper's Laws",
  },
  {
    name: "Gravitational and Orbital Motion",
    description: "Description for Gravitational and Orbital Motion",
  },
  {
    name: "Momentum and Collisions",
    description: "Description for Momentum and Collisions",
  },
],
[
  {
    name: "Commonly Used Constants",
    description: "Description for Commonly Used Constants",
  },
  {
    name: "Unit Conversion",
    description: "Description for Unit Conversion",
  },
  {
    name: "Free Body Diagrams",
    description: "Description for Free Body Diagrams",
  },
  {
    name: "Series",
    description: "Description for Series",
  },
  {
    name: "Matrices",
    description: "Description for Matrices",
  },
  {
    name: "Vectors",
    description: "Description for Vectors",
  },
  {
    name: "Logarithmic Functions",
    description: "Description for Logarithmic Functions",
  },
  {
    name: "Probability and Statistics",
    description: "Description for Probability and Statistics",
  },
  {
    name: "Differentiation",
    description: "Description for Differentiation",
  },
  {
    name: "Integration",
    description: "Description for Integration",
  },
  {
    name: "Significant Figures",
    description: "Description for Significant Figures",
  },
  {
    name: "Complex Numbers",
    description: "Description for Complex Numbers",
  },
],
[
  {
    name: "Magnetism",
    description: "Description for Magnetism",
  },
  {
    name: "Electrostatics",
    description: "Description for Electrostatics",
  },
  {
    name: "Electromagnets",
    description: "Description for Electromagnets",
  },
],
[
  {
    name: "Laws of Thermodynamics",
    description: "Description for Laws of Thermodynamics",
  },
  {
    name: "Temperature",
    description: "Description for Temperature",
  },
  {
    name: "Kinetic Theory of Cases",
    description: "Description for Kinetic Theory of Cases",
  },
  {
    name: "Heat",
    description: "Description for Heat",
  },
  {
    name: "Entropy",
    description: "Description for Entropy",
  },
  {
    name: "Macroscopic Behaviour of Ideal Gases",
    description: "Description for Macroscopic Behaviour of Ideal Gases",
  },
],
[
  {
    name: "Geometric Optics",
    description: "Description for Geometric Optics",
  },
  {
    name: "Wave Optics",
    description: "Description for Wave Optics",
  },
],
[
  {
    name: "Wave Nature of Matter",
    description: "Description for Wave Nature of Matter",
  },
  {
    name: "Heisenberg Uncertainty Principle",
    description: "Description for Heisenberg Uncertainty Principle",
  },
  {
    name: "Schrodinger's Equation",
    description: "Description for Schrodinger's Equation",
  },
  {
    name: "Hydrogen Atom",
    description: "Description for Hydrogen Atom",
  },
  {
    name: "Quantum Mechanic Wave Function",
    description: "Description for Quantum Mechanic Wave Function",
  },
  {
    name: "Operators and Observables",
    description: "Description for Operators and Observables",
  },
  {
    name: "Patricle Nature of Light",
    description: "Description for Patricle Nature of Light",
  },
]
]

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
NUM_OF_USERS.times do |x|
  puts "Iteration #{x+1} of #{NUM_OF_USERS}".green
  puts "================================================".yellow
  user = User.create!(:email => Faker::Internet.email, :password => Faker::Internet.password(7))
  puts "Creating a user with the email: #{user.email} and the password: #{user.password}".blue
  puts "================================================".yellow
end

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
