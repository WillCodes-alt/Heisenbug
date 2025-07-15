class Bug < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  belongs_to :assigned_to, class_name: :user
  belongs_to :posted_by, class_name: :user
end
