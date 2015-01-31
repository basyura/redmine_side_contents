
class RedmineSideContentsHook < Redmine::Hook::ViewListener
  include ActionView
  def view_layouts_base_sidebar(context = {})

    return unless User.current.logged?
    return unless context[:project]

    script =<<-EOF
    <script>
      $(document).ready(function() {
        $.ajax({
            url: "#{config.relative_url_root + '/side_contents_get'}",
            type: "GET",
            data: { project_id: #{context[:project].id} },
            dataType: "html",
            success: function(data) {
              $('#side_contents_container').html(data)
            },
            error: function(data) {
            }
        });
      });
      </script>
      <div id='side_contents_container' >
      </div>
    EOF

    script.html_safe
  end
end
