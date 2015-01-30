
class RedmineSideContentsHook < Redmine::Hook::ViewListener
  include ActionView
  def view_layouts_base_sidebar(context = {})
    
    return unless User.current.logged?
    return unless context[:project]

    @host = context[:request].scheme + '://' + context[:request].host_with_port
    @project = context[:project]
    @common_text  = SideContent.find_text(0)
    @project_text = SideContent.find_text(context[:project].id)

    path = ActionController::Base.view_paths.to_a.find {|v| v.to_s =~ /redmine_side_contents/ }
    path = File.join(path, 'side_contents', '_side_contents.html.erb')

    ERB.new(open(path, &:read)).result(binding)
  end
end
