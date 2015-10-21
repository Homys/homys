namespace :points do
  desc "Each day reduce the max amount of points a user can receive"
  task :adjust => :environment do
  	House.reduce_all_points
  end
  desc "Reset all of the users points at the beginning of each month"
  task :reset => :environment do
    if Date.today.day == 1
      User.reset_points
    end
  end
end

