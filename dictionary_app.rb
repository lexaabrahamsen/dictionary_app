require "http"

puts "Please enter a word and I will give you a definition"
input = gets.chomp

definition = HTTP.get("https://api.wordnik.com/v4/word.json/rainbow/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930")

pronunciations = HTTP.get("https://api.wordnik.com/v4/word.json/word/pronunciations?useCanonical=false&limit=50&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930")

word = definition.parse[1]["text"]
pronunciations = pronunciations.parse[0]["raw"]

while true
  puts "Please enter a word and I will give you a definition"
  input = gets.chomp
  if input == "q"
    break
end

p "Definition is"
p word

p "Pronunciation is:"
p pronunciations  