class Bug < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  belongs_to :assigned_to, class_name: :User, optional: true
  belongs_to :posted_by, class_name: :User

  has_many_attached :images

  enum usertype: %i[Bug Feature Improvement]
  enum status: %i[New Started Completed Resolved]

end
