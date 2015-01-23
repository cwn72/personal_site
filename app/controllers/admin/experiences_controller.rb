class Admin::ExperiencesController < ApplicationController

  layout 'admin'
  http_basic_authenticate_with name: 'admin', password: ENV['ADMIN_PASS']

  def create
    @resume = Resume.find(params[:resume_id])
    @experience = @resume.experiences.new(experience_params)
    if @experience.save
      flash[:success] = 'Successfully added experience'
      redirect_to admin_resume_path(@resume.id)
    else
      render 'admin/resumes/show'
    end
  end

  def destroy
    @resume = Resume.find(params[:resume_id])
    @experience = @resume.experiences.find(params[:id])
    @experience.delete
    flash[:danger] = 'Experience successfully deleted'
    redirect_to admin_resume_path(@resume.id)
  end

  private

    def experience_params
      params.require(:experience).permit(:job_title,:company,:current,:start_date,:end_date,:overview)
    end

end
