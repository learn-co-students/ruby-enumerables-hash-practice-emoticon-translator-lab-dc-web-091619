require "yaml"
require "pry"


def load_library(path)
  emo_data=YAML.load_file(path)
  hash={
    "get_meaning"=>{},
    "get_emoticon"=>{}
  }
  emo_data.each do |key,arr|
    if !hash["get_meaning"][arr[1]]
      hash["get_meaning"][arr[1]]=key
    end
    if !hash["get_emoticon"][arr[0]]
      hash["get_emoticon"][arr[0]]=arr[1]
    end
  end
  hash
end

def get_japanese_emoticon(path,emoticon)
  load_library(path)["get_emoticon"].each do |e_emo,j_emo|
    if emoticon == e_emo
      return j_emo
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  load_library(path)["get_meaning"].each do |j_emo,meaning|
    if emoticon == j_emo
      return meaning
    end
  end
  "Sorry, that emoticon was not found"
end







