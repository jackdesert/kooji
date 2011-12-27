class ImportsController < ApplicationController

  def support
    @user_guide_html = elyxer
  end

  def elyxer
    raw = "doc/Regi_FAQ.lyx"
    html = "public/Regi_FAQ.html"
    # Generate a new html file unless raw file is older than generated
    output_file = generate_html(raw, html) # unless File.exists?(html) and File.new(raw).mtime < File.new(html).mtime
    return get_file_as_string(output_file)
  end

  def generate_html(raw, html)
    input_file = File.expand_path(raw)
    output_file = File.expand_path(html)
    command = "elyxer #{input_file} #{output_file}"
    system(command)
    return output_file
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
