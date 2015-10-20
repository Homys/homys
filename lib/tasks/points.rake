namespace :points do
  desc "TODO"
  task :adjust => :environment do
  	House.reduce_all_points
  end 
end

