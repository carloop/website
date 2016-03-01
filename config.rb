###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

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

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Render page.html.haml to page/index.html
activate :directory_indexes
page "/404.html", :directory_index => false

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.deploy_method = :sftp
  deploy.host = "carloop.io"
  deploy.path = "/var/website"
  deploy.user = "root"

  deploy.build_before = true
end

# Build-specific configuration
configure :build do
  # Minify CSS and Javascript on build
  activate :minify_javascript
  activate :minify_css

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Build favicon.ico
  activate :favicon_maker, :icons => {
    "_favicon_template.svg" => [
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },         # Used by IE, and also by some other browsers if we are not careful.
      { icon: "favicon.png", size: "16x16" },                           # The classic favicon, displayed in the tabs.
      { icon: "favicon-16x16.png" },                                    # The classic favicon, displayed in the tabs.
      { icon: "favicon-32x32.png" },                                    # For Safari on Mac OS.
      { icon: "favicon-96x96.png" },                                    # For Google TV.
      { icon: "favicon-196x196.png" },                                  # For Android Chrome M31+.
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-152x152-precomposed.png" },
    ]
  }
end
