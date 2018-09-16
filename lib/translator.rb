require 'yaml'
require 'pry'

path = './lib/emoticons.yml'

def load_library(path)
  yaml_library = YAML.load_file(path)
  library = {'get_meaning' => {}, 'get_emoticon' =>{}}
  yaml_library.each do |meaning, emoticon_array|    #meaning = 'angel'etc.   emoticon_array = symbols in eng and jap
    library['get_meaning'][emoticon_array[1]] = meaning
    library['get_emoticon'][emoticon_array[0]] = emoticon_array[1]
  end
  library
end

# def get_japanese_emoticon(path, emoticon)
#   library = load_library(path)
#   library.each do |task, info|   #task = get_meaning / get_emoticon     info = 2 x hashes
#     info.each do |key_and_value|    #key_and_value = ["☜(⌒▽⌒)☞", "angel"] etc...
#       if key_and_value[0] == emoticon
#         return key_and_value[1]
#       else
#         return 'Sorry, that emoticon was not found'
#       end
#     end
#   end
# end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library['get_emoticon'][emoticon]
    return library['get_emoticon'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library['get_meaning'][emoticon]
    return library['get_meaning'][emoticon]
  else
    return 'Sorry, that emoticon was not found'
  end
end
