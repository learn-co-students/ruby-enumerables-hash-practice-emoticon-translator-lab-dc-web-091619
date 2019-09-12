require 'pry'
require 'yaml'
# filepath = "./lib/emoticons.yml"
def load_library(filepath)
   emoticons = YAML.load_file(filepath)
   hash = {'get_meaning' => {},
   'get_emoticon'=> {}}
   emoticons.each do |name,value|
    
    hash['get_meaning'][value[1]] = name
    hash['get_emoticon'][value[0]] = value[1]
  end
  return hash
end

def get_japanese_emoticon(filepath,emoticon)
  japanese_hash = load_library(filepath)  
  if japanese_hash['get_emoticon'][emoticon].nil?
    return "Sorry, that emoticon was not found"
  else
return japanese_hash['get_emoticon'][emoticon]
  end
end

def get_english_meaning(filepath,emoticon)
  new_hash = load_library(filepath)  
if new_hash['get_meaning'][emoticon].nil?
  return "Sorry, that emoticon was not found"
else 
  return new_hash['get_meaning'][emoticon]
  end
end

