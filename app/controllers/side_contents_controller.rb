class SideContentsController < ApplicationController
  unloadable

  def edit
    render_view
  end

  def save
    SideContent.save_text(params)
    render_view
  end

  private
  def render_view
    @host         = request.scheme + '://' + request.host_with_port
    @project      = Project.find(params[:project_id])
    @common_text  = SideContent.find_text(0)
    @project_text = SideContent.find_text(params[:project_id])

    respond_to do |format|
      format.js
    end
  end
end
