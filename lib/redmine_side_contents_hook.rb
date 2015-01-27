
class RedmineSideContentsHook < Redmine::Hook::ViewListener
  def view_layouts_base_sidebar(context = {})
    
    return unless User.current.logged?
    return unless context[:project]

    link = link_to("編集", {:controller => 'side_contents', :action => 'edit', :project_id => context[:project].id }, :remote => true, :method => 'get')
      
    html =<<-EOF
      <div>
        <div style="float:right;color:#888;margin-right:10px;">#{link}</div>
        <h3>SideContents</h3>
      </div>
    EOF

    common_text  = SideContent.find_text(0)
    project_text = SideContent.find_text(context[:project].id)

    html << textilizable(common_text, object: context[:project])
    html << textilizable(project_text, object: context[:project])
    html
  end
end
