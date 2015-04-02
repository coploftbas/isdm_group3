class Project < ActiveRecord::Base
	def self.search(search)
	  if search
	  	Project.where("project_name iLIKE ?", "%#{search}%" )
	  else
	  	Project.all
	  end
	end
end
