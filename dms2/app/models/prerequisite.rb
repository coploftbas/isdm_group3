class Prerequisite < ActiveRecord::Base
  belongs_to :document_id
  belongs_to :prerequisite_id
end
