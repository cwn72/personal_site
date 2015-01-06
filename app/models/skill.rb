class Skill < ActiveRecord::Base
  validates_presence_of :name, :experience
  validates :experience, numericality: {only_integer: true, greater_than: -1, less_than: 6}
  validates :years, numericality: {only_integer: true, greater_than: 0, less_than: 101},
            allow_nil: true
  belongs_to :resume
end
