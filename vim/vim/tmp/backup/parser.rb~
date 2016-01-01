#!/usr/bin/env ruby
require 'mechanize'
require 'colorize'

class Parser
  URL = 'http://ilibrary.ru/text/'

  def find_poems
    mechanize = Mechanize.new

    page = mechanize.get('http://ilibrary.ru/author/pushkin/l.all/index.html')
    links = page.parser.css('.list a')

    id_poems = links.map { |l| l.attributes['href'].value }
      .select { |l| l =~ %r{/text/\d+/index\.html} }
      .map { |l| l.scan(/\d+/)[0] }.uniq

    num = 0
    size = id_poems.size
    puts "About to write #{size} poems..."

    @poems = []
    id_poems.each do |id|
      link = URL + id + '/p.1/index.html'

      page = mechanize.get(link)

      title = page.parser.css('.title h1').text
      text = page.parser.css('.poem_main').text
      text.gsub!(/\u0097/, '\u2014') # replacement of unprintable symbol
      text.gsub!(/^\n/, "") # remove first \n

      @poems << {title: "#{title}", text: "#{text}" }
      puts '='.cyan*30
      puts title.green
      puts text.red
      puts "#{num} of #{size}".cyan
      num += 1
      @poems
    end
    File.open("../db/pushkin_db.json","w") do |f|
      f.write(@poems.to_json)
    end
  end
end

Parser.new.find_poems
