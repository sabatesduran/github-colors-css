require 'yaml'
require 'open-uri'

URL = "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml"

# All the names will be changed to be readeable for css
def to_css_name(e)
  # Downcase the name
  css_name = e.downcase
  # Change the spaces for -
  css_name = css_name.gsub(/\s/, '-')
  # Change ' for -
  css_name = css_name.gsub(/\'/, '-')
  # Change # for -sharp
  css_name = css_name.gsub(/\#/, '-sharp')
  # Change + for p
  css_name = css_name.gsub(/\+/, 'p')
end

# Load YAML file
yalm_hash = YAML.load_file(open(URL))

# Open CSS file
css_file = File.open("github-colors.css", "w")

yalm_hash.map do |e, i|
  unless i["color"].nil?
    # Add comment with language name
    css_file.write("/* #{e} */\n")
    # Change programming language name
    css_name = to_css_name(e);
    # Adding css background-color class
    css_file.write(".ghc-#{css_name}-bg { background-color: #{i['color']}; }\n")
    # Adding css color class
    css_file.write(".ghc-#{css_name} { color: #{i['color']}; }\n")
  end
end

# Close file
css_file.close
