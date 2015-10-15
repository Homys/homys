namespace :chores do
  desc "TODO"
  task :assign => :environment do
  	if Date.today.cwday == 7
  		House.all.each do |house|
  			house.assign_chores
  		end 
  	end 
  end
end 
