class SideContent < ActiveRecord::Base
  unloadable

  def self.find_text(project_id)
    fav = SideContent.where(user_id: User.current.id, project_id: project_id).first
    fav ? fav.text : ""
  end

  def self.save_text(params)
    SideContent.transaction do
      common = SideContent.where(user_id: User.current.id, project_id: 0).first
      common ||= SideContent.new(user_id: User.current.id, project_id: 0)
      common.text = params[:common_text]
      common.save

      project = SideContent.where(user_id: User.current.id, project_id: params[:project_id]).first
      project ||= SideContent.new(user_id: User.current.id, project_id: params[:project_id])
      project.text = params[:project_text]
      project.save
    end
  end
end
