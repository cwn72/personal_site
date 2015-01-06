class Resume < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :phone, presence: true,
            format: {with: /\A[0-9\-\(\)\.]+\z/}
  validates :site, presence: true

  has_many :experiences
  has_many :skills
  has_many :projects
end
