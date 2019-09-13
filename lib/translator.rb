require "pry"
require "yaml"

def load_library(file)
  hash = YAML.load_file(file)
  organized_hash = {:get_meaning => {}, :get_emoticon => {}}
  hash.each do |key, value|
    organized_hash[:get_meaning][value[1]] = key
    organized_hash[:get_emoticon][value[0]] = value[1]
    end
  return organized_hash
end

def get_japanese_emoticon(file, emoticon)
  emoticon_hash = load_library(file)
  if emoticon_hash[:get_emoticon][emoticon] == nil
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  else emoticon_hash[:get_emoticon][emoticon]
  end 
end

def get_english_meaning(file, emoticon)
  emoticon_hash = load_library(file)
  if emoticon_hash[:get_meaning][emoticon] == nil 
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  else emoticon_hash[:get_meaning][emoticon]
  end 
end