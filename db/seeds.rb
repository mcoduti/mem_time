# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Character.create(language: 'mandarin', translation: 'I', tone: '3rd', english_spelling: 'wǒ', character: '我')
Character.create(language: 'mandarin', translation: 'you', tone: '3rd', english_spelling: 'nǐ', character: '你')
Character.create(language: 'mandarin', translation: 'am/are/is', tone: '4th', english_spelling: 'shì', character: '是')
Character.create(language: 'mandarin', translation: 'I + de = mine', tone: '5th', english_spelling: 'de', character: '的')
Character.create(language: 'mandarin', translation: 'little', tone: '3rd', english_spelling: 'xiǎo', character: '小')
