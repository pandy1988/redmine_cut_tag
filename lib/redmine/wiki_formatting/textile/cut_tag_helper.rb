if Rails::VERSION::STRING < '5.0.0'

  module Redmine
    module WikiFormatting
      module Textile
        module Helper

          def heads_for_wiki_formatter_with_cut_tag
            heads_for_wiki_formatter_without_cut_tag
            unless @heads_for_wiki_formatter_with_cut_tag_included
              content_for :header_tags do
                javascript_include_tag('jstoolbar/cut_tag', plugin: 'redmine_cut_tag') +
                  javascript_include_tag("jstoolbar/lang/cut_tag-#{current_language.to_s.downcase}", plugin: 'redmine_cut_tag') +
                  stylesheet_link_tag('jstoolbar_cut_tag', plugin: 'redmine_cut_tag')
              end
              @heads_for_wiki_formatter_with_cut_tag_included = true
            end
          end

          alias_method :heads_for_wiki_formatter_without_cut_tag, :heads_for_wiki_formatter
          alias_method :heads_for_wiki_formatter, :heads_for_wiki_formatter_with_cut_tag

        end
      end
    end
  end

else

  module Redmine
    module WikiFormatting
      module Textile
        module CutTagHelper

          def heads_for_wiki_formatter
            super
            unless @heads_for_wiki_formatter_with_cut_tag_included
              content_for :header_tags do
                javascript_include_tag('jstoolbar/cut_tag', plugin: 'redmine_cut_tag') +
                  javascript_include_tag("jstoolbar/lang/cut_tag-#{current_language.to_s.downcase}", plugin: 'redmine_cut_tag') +
                  stylesheet_link_tag('jstoolbar_cut_tag', plugin: 'redmine_cut_tag')
              end
              @heads_for_wiki_formatter_with_cut_tag_included = true
            end
          end

        end
      end
    end
  end

  module Redmine::WikiFormatting::Textile::Helper
    prepend Redmine::WikiFormatting::Textile::CutTagHelper
  end

end
