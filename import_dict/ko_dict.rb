require 'rubygems'
require 'nokogiri'
require 'open-uri'


 puts "Downloading..."
1.upto(5) do |i|
  page_url = "http://www.koreanclass101.com/korean-word-lists/?page=#{i}"
  page = Nokogiri::HTML(open(page_url)) 
  words = page.css('table.cx_table tr')[1..-1]
  local_fname = 'ko_dict.txt'

  File.open local_fname, 'a' do |file|
    words.each do |w|
      file.print w.css('td.cx_td_word').text.strip.gsub(/[?.!]/, '')
      file.print ','
      file.puts w.css('td.cx_td_english').text.strip.downcase.gsub(/[?.!]/, '')
    end
  end
end
puts "Download Completed"
