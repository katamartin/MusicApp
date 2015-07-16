module ApplicationHelper
  def authenticate
    html = <<-HTML
      <input type=\"hidden\"
             name=\"authenticity_token\"
             value=\"#{form_authenticity_token}\">
    HTML

    html.html_safe
  end

  def up_one_level(object)
    if object.is_a?(Track)
      html = "<a href=\"#{album_url(object.album)}\">Go to Album</a>"
    elsif object.is_a?(Album)
      html = "<a href=\"#{band_url(object.band)}\">Go to Band</a>"
    else
      html = "<a href=\"#{bands_url}\">See All Bands</a>"
    end

    html.html_safe
  end

  def make_new_for(object)
    if object.is_a?(Band)
      html = "<a href=\"#{new_album_url}\">Make New Album</a>"
    elsif object.is_a?(Album)
      html = "<a href=\"#{new_track_url}\">Make New Track</a>"
    end

    html.html_safe
  end

  def delete_button(object)
    type = object.class.to_s.downcase
    html = "<form action=\"<%= #{type}_url(#{object}) %>\" method=\"GET\">"
    html += "<input type=\"hidden\" name=\"_method\" value=\"DELETE\">"
    html += "<input type=\"submit\" value=\"Delete\">"
    html += "</form>"

    html.html_safe
  end

end
