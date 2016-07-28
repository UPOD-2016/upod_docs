Dir[Rails.root.join('db', 'seed_data', '*.rb')].each { |file| require file }

namespace :wlu do
  desc "Load real categories and their subcategories"
  task :create_nested_categories => :environment do
    categories = SeedData::Categories.all
    subcategories = SeedData::Subcategories.all
    categories.each_with_index do |attrs, index|
      category = Category.create!(attrs)
      puts "Creating #{category.name}"
      category.subcategories.create(subcategories.at(index))
    end
  end
end