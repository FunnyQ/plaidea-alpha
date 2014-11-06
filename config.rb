require "helpers/qhelpers"

# Change Compass configuration
compass_config do |config|
  config.output_style = :nested
  config.line_comments = false
end


###
# Page options, layouts, aliases and proxies
###

# Default layout
page "/*", layout: "application"

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

helpers Qhelpers

# Add bower's directory to sprockets asset path
after_configuration do
  sprockets.append_path File.join root, 'bower_components'
  sprockets.append_path File.join root, 'bower_components', 'bootstrap-sass-official', 'assets', 'fonts'
  sprockets.append_path File.join root, 'bower_components', 'fontawesome', 'fonts'
end

# Asset paths
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'
set :fonts_dir,  "fonts"


# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# i18n
# activate :i18n, :langs => [:zh_TW, :en]

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do

  # create favicon and touch icons
  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source')
    f.output_dir    = File.join(root, 'build')
    f.icons = {
      "_favicon_template_hires.png" => [
        { icon: "apple-touch-icon-152x152-precomposed.png" },
        { icon: "apple-touch-icon-144x144-precomposed.png" },
        { icon: "apple-touch-icon-114x114-precomposed.png" },
        { icon: "apple-touch-icon-72x72-precomposed.png" },
        { icon: "mstile-144x144", format: :png },
      ],
      "_favicon_template_lores.png" => [
        { icon: "favicon.png", size: "16x16" },
        { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
      ]
    }
  end

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # optimizing images
  activate :imageoptim

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

end
