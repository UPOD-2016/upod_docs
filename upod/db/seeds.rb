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
    name: "Electricity & Magnetism",
    description: "Electricity & Magnetism",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Fundamentals",
    description: "Fundamentals",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Optics",
    description: "Optics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Quantum Physics",
    description: "Quantum Physics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Statistical Physics",
    description: "Statistical Physics",
    remote_image_url: "http://lorempixel.com/200/200/",
  },
  {
    name: "Thermodynamics",
    description: "Thermodynamics",
    remote_image_url: "http://lorempixel.com/200/200/",
  }
]

Category.create!(categories)
