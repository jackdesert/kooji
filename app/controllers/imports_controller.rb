class ImportsController < ApplicationController



  def featured_events
    require 'open-uri'
    @page = Nokogiri::HTML(open("http://www.hbbostonamc.org/trips.php"))
  end

  def support
    @user_guide_html = elyxer
  end

  def elyxer
    raw = "doc/Regi_FAQ.lyx"
    html = "public/Regi_FAQ.html"
    input_file = File.new(raw)
    output_file = File.expand_path(html)
    # Generate a new html file unless raw file is older than generated
    generate_html(raw, html) unless File.exists?(html) and File.new(raw).mtime < File.new(html).mtime
    return get_file_as_string(output_file)
  end

  def generate_html(raw, html)
    input_file = File.expand_path(raw)
    output_file = File.expand_path(html)
    command = "elyxer --raw #{input_file} #{output_file}"
    system(command)
  end

  def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r")
    f.each_line do |line|
      data += line
    end
    f.close
    return data
  end
end
