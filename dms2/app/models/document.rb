class Document < ActiveRecord::Base
 belongs_to :user
 # belongs_to :updated_by
 belongs_to :project




end