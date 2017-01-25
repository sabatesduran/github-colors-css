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

def to_css(name, color)
  ".ghc-#{name} { color: #{color}; }\n.ghc-#{name}-bg { background-color: #{color}; }\n"
end

def to_sass(name, color)
  "$ghc-#{name}: #{color};\n"
end

def to_less(name, color)
  "@ghc-#{name}: #{color};\n"
end

# Load YAML file
yalm_hash = YAML.load_file(open(URL))

# Open files
css_file = File.open("github-colors.css", "w")
sass_file = File.open("github-colors.scss", "w")
less_file = File.open("github-colors.less", "w")

yalm_hash.map do |e, i|
  unless i["color"].nil?
    # Variables
    language_name = "/* #{e} */\n"
    language_parsed = to_css_name(e)
    color = i['color']

    # Adding colors to files
    css_file.write(to_css(language_parsed, color))
    sass_file.write(to_sass(language_parsed, color))
    less_file.write(to_less(language_parsed, color))
  end
end

# Close file
css_file.close
sass_file.close
less_file.close
