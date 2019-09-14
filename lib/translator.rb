require"yaml"
require'pry'

def load_library(emoticons)
 hash = YAML.load_file(emoticons)
 new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
 hash.each do |emoticon, values|
   new_hash["get_meaning"][values[1]] = emoticon
   new_hash["get_emoticon"][values[0]] = values[1]
   end
return new_hash
 end

def get_japanese_emoticon(file_path, emoticon )
hash = load_library(file_path)
new_hash = hash["get_emoticon"]
new_hash.each do |english|
  if english[0] == emoticon 
    return english[1]
    end
  end
  return "Sorry, that emoticon was not found"
 end


def get_english_meaning(file_path, emoticon)
 hash = load_library(file_path)
new_hash = hash["get_meaning"]
new_hash.each do |japanese|
 
  if japanese[0] == emoticon
    return japanese[1]
   
 end
 end
 return "Sorry, that emoticon was not found"
end