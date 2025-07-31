class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_many :projects , foreign_key: :creator_id, dependent: :destroy
  has_many :bugs , through: :projects
  has_many :comments, through: :bugs
  has_many :enrollments
  has_many :project_enrollment , through: :enrollments ,source: :project

  enum role: [:Manager, :Developer, :Quality]

  def name_with_type
    "#{full_name} - #{role}"
  end
end
