namespace :wlu do
  desc 'Generate Entity Relationship Diagram'
  task :generate_erd do
    system "bundle exec railroady -a -M | dot -Tpng > models.png"
  end
  task :generate_erd_as_xmi do
    system "bundle exec railroady -a -x -M"
  end
end
