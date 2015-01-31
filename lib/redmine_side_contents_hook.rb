
class RedmineSideContentsHook < Redmine::Hook::ViewListener
  include ActionView
  def view_layouts_base_sidebar(context = {})

    return unless User.current.logged?
    return unless context[:project]

    url = ''
    url << config.relative_url_root if config.relative_url_root
    url << '/side_contents_get'

    script =<<-EOF
      <script type="text/javascript">
      //<![CDATA[
      $(document).ready(function() {
        $.ajax({
            url: "#{url}",
            type: "GET",
            data: { project_id: #{context[:project].id} },
            dataType: "html",
            beforeSend: function(data) {
              $('#ajax-indicator').attr('id', 'side_contents_ajax-indicator');
            },
            success: function(data) {
              $('#side_contents_container').html(data);
            },
            error: function(data) {
              $('#side_contents_container').html('error');
            },
            complete: function(data) {
              $('#side_contents_ajax-indicator').attr('id', 'ajax-indicator');
            }
        });
      });
      //]]>
      </script>
      <div id='side_contents_container' >
      </div>
    EOF

    script.html_safe
  end
end
