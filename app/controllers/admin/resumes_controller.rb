class Admin::ResumesController < ApplicationController

  layout 'admin'
  http_basic_authenticate_with name: 'admin', password: 'password'

  def index
    @resumes = Resume.all
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    if @resume.save
      flash[:success] = 'Resume successfully created'
      redirect_to admin_resume_path(@resume.id)
    else
      render 'new'
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      flash[:success] = 'Successfully updated resume'
      redirect_to admin_resume_path(@resume.id)
    else
      render 'edit'
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.delete
    flash[:danger] = 'Resume deleted'
    redirect_to admin_resumes_path
  end

  private

    def resume_params
      params.require(:resume).permit(:name,:email,:phone,:site)
    end

end
