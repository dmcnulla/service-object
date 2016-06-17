require 'crack'
require 'json'

LIST_KILL = ['grammars', 'xmlns', 'xmlns:tns', 'xmlns:xsd', 'xmlns:xsi', 'xmlns:ya', 'xmlns:yn', 'xsi:schemaLocation']

def convert(filename)
  xml = Crack::XML.parse(File.read(filename))
  LIST_KILL.each { |key| xml['application'].delete(key) }
  json = JSON.pretty_generate(xml)
  File.open("#{filename[0..-6]}_wadl.json", 'w'){|f| f.write(json) }
end
