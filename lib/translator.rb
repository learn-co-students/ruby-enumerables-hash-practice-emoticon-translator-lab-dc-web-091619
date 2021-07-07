require "yaml"
require "pry"
def load_library(path)
emot_trans = YAML.load_file(path)

emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}

emot_trans.each do |key, value|
    emoticon_hash["get_emoticon"][value.first] = value.last
    emoticon_hash["get_meaning"][value.last] = key
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  trans = emoticon_hash["get_emoticon"][emoticon]
  if trans == nil 
    trans = "Sorry, that emoticon was not found"
  end
  trans 
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  eng = emoticon_hash["get_meaning"][emoticon] 
  if eng == nil 
    eng = "Sorry, that emoticon was not found"
  end
  eng 
end