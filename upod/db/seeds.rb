# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all

categories = [
  {
    name: "Electricity",
    description: "Description for Electricity & Magnetism",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Fundamentals",
    description: "Description for Fundamentals",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Optics",
    description: "Description for Optics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Quantum",
    description: "Description for Quantum Physics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Statistical",
    description: "Description for Statistical Physics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Thermodynamics",
    description: "Description for Thermodynamics",
    remote_image_url: "http://lorempixel.com/200/200/",
  }
]

Category.create!(categories)
