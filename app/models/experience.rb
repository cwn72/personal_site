class Experience < ActiveRecord::Base
  validates_presence_of :job_title, :company, :start_date, :overview
  validates_inclusion_of :current, :in => [true, false]
  belongs_to :resume
end
