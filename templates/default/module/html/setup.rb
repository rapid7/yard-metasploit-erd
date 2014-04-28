#
# Standard Library
#

require 'tempfile'

#
# Gems
#

require 'metasploit/erd'

def init
  super
  sections.place(:entity_relationship_diagram).before(:children)
end

def entity_relationship_diagram
  unless erd_empty?
    generate_entity_relationship_diagram
    erb(:entity_relationship_diagram)
  end
end

def erd_empty?
  entity.cluster.class_set.empty?
end

def entity
  @entity ||= ::Metasploit::ERD::Entity::Namespace.new(object.title)
end

#
# Generates a file to the output with the specified contents.
#
# @example saving a custom html file to the documenation root
#
#   asset('my_custom.html','<html><body>Custom File</body></html>')
#
# @param [String] path relative to the document output where the file will be
#   created.
# @param [String] content the contents that are saved to the file.
def asset(path, content)
  if options.serializer
    log.capture("Generating asset #{path}") do
      options.serializer.serialize(path, content)
    end
  end
end

def generate_entity_relationship_diagram
  Dir.mktmpdir { |directory|
    diagram = entity.diagram(directory: directory)
    temporary_path = diagram.create

    content = File.read(temporary_path)
    asset_path = File.join('images', "#{object.title.underscore}.erd.#{diagram.send(:filetype)}")
    asset(asset_path, content)
  }
end
