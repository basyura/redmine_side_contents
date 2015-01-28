class SideContentsController < ApplicationController
  unloadable

  def edit
    @project_id   = params[:project_id]
    @common_text  = SideContent.find_text(0)
    @project_text = SideContent.find_text(params[:project_id])

    respond_to do |format|
      format.js
    end
  end

  def save
    SideContent.save_text(params)

    @project      = Project.find(params[:project_id])
    @common_text  = SideContent.find_text(0)
    @project_text = SideContent.find_text(params[:project_id])

    respond_to do |format|
      format.js
    end
  end
end
