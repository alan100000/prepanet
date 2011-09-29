# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone
Mime::Type.register "application/vnd.ms-excel", :xls
ActionController::Renderers.add :xls do |object, options|
  self.send_data object.to_xls_data, :type => :xls
end