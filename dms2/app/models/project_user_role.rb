class ProjectUserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :project

  	def self.search(search)
	  if search
	  	Project.where("project_name iLIKE ?", "%#{search}%" )
	    # Project.find(:all, :conditions => ['project_name LIKE ?', "%#{search}%"])
	  else
	  	Project.all
	  end
	end
end
