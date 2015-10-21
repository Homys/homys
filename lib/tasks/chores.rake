namespace :chores do
  desc "Randomizes who is assigned to each chore every Sunday"
  task :assign => :environment do
  	if Date.today.cwday == 7
  		House.all.each do |house|
  			house.assign_chores
  		end
  	end
  end
end
