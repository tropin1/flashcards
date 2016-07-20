# This file should contain all the record creation
# needed to seed the database with its default values.
# The data can then be loaded with the rails
# db:seed command (or created alongside the database with db:setup).
# Examples:
# movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation
# needed to seed the database with its default values.
# The data can then be loaded with the rails
# db:seed command (or created alongside the database with db:setup).
# Examples:
# movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

require 'open-uri' 
require 'nokogiri'
page = Nokogiri::HTML(open('http://russian.languagedaily.com/wordsandphrases/russian-cognates'))
page.css('.jsn-article-content li').each do |links|
  last_text = links.text.split('---').last
  first_text = links.text.split('---').first
  Card.create!(original_text: first_text, translated_text: last_text)
end
