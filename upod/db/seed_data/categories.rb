module SeedData
  module Categories
    def self.all
      [{
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
    end
  end
end
