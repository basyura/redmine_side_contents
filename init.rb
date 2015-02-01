require File.dirname(__FILE__) + '/lib/redmine_side_contents_hook'

Redmine::Plugin.register :redmine_side_contents do
  name 'Redmine Side Contents plugin'
  author 'basyura'
  description 'This is a editable sidebar plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/basyura/redmine_side_contents'
  author_url 'basyura.org'
end
