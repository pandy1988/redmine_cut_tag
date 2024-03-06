require 'redmine'

require File.expand_path('../lib/redmine_cut_tag/hooks', __FILE__)
require File.expand_path('../lib/redmine_cut_tag/macros', __FILE__)
require File.expand_path('../lib/redmine/wiki_formatting/textile/cut_tag_helper', __FILE__)

Redmine::Plugin.register :redmine_cut_tag do
  name 'Redmine Cut Tag Plugin'
  author 'Restream'
  description 'This plugin enables you to hide text behind links in Redmine using the cut tag.'
  version '2.0.8'
  url 'https://github.com/Restream/redmine_cut_tag'
  author_url 'http://github.com/Restream'
  requires_redmine version_or_higher: '2'
end
