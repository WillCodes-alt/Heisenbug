class ProjectEnrollment < ApplicationRecord
  self.table_name = "Projects_Users"
  belongs_to :project
  belongs_to :user
end
