# ============================================================================ #
# Middleman Config
#
# More settings:
# http://rubydoc.info/github/middleman/middleman/Middleman/Application
# http://rubydoc.info/github/middleman/middleman/Middleman/Extensions
# ============================================================================ #

require "sass-globbing"

# Project
set :layout, "sticky"
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :partials_dir, "shared"

# Under the Hood
compass_config { |c| c.output_style = :expanded }
activate :livereload, :grace_period => 0.25 if development?
activate :directory_indexes
activate :sprockets
activate :syntax
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true,
               :autolink => true,
               :superscript => true,
               :with_toc_data => true,
               :smartypants => true

# Build
configure :build do
  ignore "/styleguide/index.html"
  ignore "/assets/images/sprites/puppy*"
  ignore "/assets/images/example*"
  ignore "/assets/*/grid_preview.*"
  ignore "/**README.md"

  compass_config { |c| c.output_style = :compressed }
  activate :minify_javascript, :ignore => /vendor\/*/
  activate :asset_hash, :ignore => ["favicon.ico"]
  #activate :asset_host, :host => "//EXAMPLE.cloudfront.net"
end
