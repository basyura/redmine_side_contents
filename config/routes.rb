# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
RedmineApp::Application.routes.draw do
  get  'side_contents_edit', :to => 'side_contents#edit'
  post 'side_contents_save', :to => 'side_contents#save'
end
