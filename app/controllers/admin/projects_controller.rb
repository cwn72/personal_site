class Admin::ProjectsController < ApplicationController

  layout 'admin'
  http_basic_authenticate_with name: 'admin', password: ENV['ADMIN_PASS']

  def create
    @resume = Resume.find(params[:resume_id])
    @project = @resume.projects.new(project_params)
    if @project.save
      flash[:success] = 'Successfully created project'
      redirect_to admin_resume_path(@resume.id)
    else
      render 'admin/resumes/show'
    end
  end

  def destroy
    @resume = Resume.find(params[:resume_id])
    @project = @resume.projects.find(params[:id])
    #remove image from aws storage
    @project.image = nil
    @project.save
    @project.delete
    flash[:danger] = 'Successfully deleted project'
    redirect_to admin_resume_path(@resume.id)
  end

  private

    def project_params
      params.require(:project).permit(:name,:link,:image)
    end

end
