class ImportsController < ApplicationController



  def featured_events
    require 'open-uri'
    page = Nokogiri::HTML(open("http://www.hbbostonamc.org/trips.php"))
    @content = page.css("div#layer10 + div")
    @tab_active_listings = :active
  end

  def support
    @user_guide_html = elyxer
    @tab_active_support = :active    
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
    elyxer_path = File.expand_path("lib/elyxer/elyxer.py")
    input_file = File.expand_path(raw)
    output_file = File.expand_path(html)
    command = "python #{elyxer_path} --raw #{input_file} #{output_file}"
    raise "support page not generated"  if system(command).nil?
    
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
