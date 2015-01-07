class ResumeController < ApplicationController

  layout 'blank'

  def show
    @resume = Resume.find(1)
  end

end
