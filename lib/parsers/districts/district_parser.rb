require 'json'
require 'rexml/document'

file = open('districts.json')
json = JSON.parse(file.read)

result = 'var policeData = {"type":"FeatureCollection","features":[' + " \n"

json['features'].each do |feature|
  coordinates = feature['geometry']['geometries'][1].to_s.delete(' ').gsub('=>',':')
  xml         = REXML::Document.new('<xml>'+feature['properties']['Description']+'</xml>')
  items       = xml.elements.to_a('//span')
  beat        = items[7][0].to_s
  result += "{\"type\":\"Feature\",\"properties\":{\"beat\":\"#{beat}\"},\"geometry\":#{coordinates}},\n"
end

result.chop!
result.chop!

result += ']}'

File.open('police.js', 'w') { |file| file.write(result) }
