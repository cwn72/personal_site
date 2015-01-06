class AddResumeToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :resume
  end
end
