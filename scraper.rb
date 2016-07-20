require 'rubygems'
require 'mechanize'
require 'csv'

results = []

agent = Mechanize.new

page = agent.get('http://google.com/')
google_form = page.form('f')
google_form.q = 'runescape'
page = agent.submit(google_form)

page.links.each do |link|
  puts link.text
  results << link.text
end

# title =   page.search(:id => "gbqf").text.strip
# results << title
# puts results

CSV.open('csv_file.csv', 'a') do |csv|
    # each one of these comes out in its own row.
    csv << [results]
end
