module TracksHelper
  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")
    lines.map do |line|
       "&#9835 #{h(line)}"
    end.join("\n").html_safe
  end
end
