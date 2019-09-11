require "yaml"

def load_library(file_path)
    emoticons_library = YAML.load_file(file_path)

    new_hash = {
        get_meaning: {},
        get_emoticon: {}
    }

    emoticons_library.each do |key,value|
        new_hash[:get_meaning][value[1]] = key #Japanese = string description
        new_hash[:get_emoticon][value[0]] = value[1] #Western = Japanese
    end

    new_hash
end

def get_japanese_emoticon(file_path, emoticon)
    new_hash = load_library(file_path)

    if new_hash[:get_emoticon].key?(emoticon)
        return new_hash[:get_emoticon][emoticon]
    else
        return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, emoticon)
    new_hash = load_library(file_path)

    if new_hash[:get_meaning].key?(emoticon)
        return new_hash[:get_meaning][emoticon]
    else
        return "Sorry, that emoticon was not found"
    end
end
