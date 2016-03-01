module UrlHelpers
  def host_with_port
    "https://www.carloop.io"
  end

  def image_url(source)
    host_with_port + image_path(source)
  end

  def absolute_url(source = "")
    host_with_port + source
  end
end
