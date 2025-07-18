class Bug < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  belongs_to :assigned_to, class_name: :User
  belongs_to :posted_by, class_name: :User
end
