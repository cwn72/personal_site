class Admin::SkillsController < ApplicationController

  layout 'admin'
  http_basic_authenticate_with name: 'admin', password: 'password'

  def create
    @resume = Resume.find(params[:resume_id])
    @skill = @resume.skills.new(skill_params)
    if @skill.save
      flash[:success] = 'Skill successfully created'
      redirect_to admin_resume_path(@resume.id)
    else
      render 'admin/resumes/show'
    end
  end

  def destroy
    @resume = Resume.find(params[:resume_id])
    @skill = @resume.skills.find(params[:id])
    @skill.delete
    flash[:danger] = 'Skill successfully deleted'
    redirect_to admin_resume_path(@resume.id)
  end

  private

    def skill_params
      params.require(:skill).permit(:name,:experience,:years)
    end

end
