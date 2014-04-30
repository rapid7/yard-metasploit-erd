require 'rails_erd/domain'

def init
  super

  if object == '_index.html'
    layout = sections[:layout]

    unless layout
      raise ArgumentError,
            "Could not find layout subsection in root sections"
    end

    index = layout[:index]

    unless index
      raise ArgumentError,
            "Could not find index subsection in layout section"
    end

    index.place(:entity_relationship_diagram).before(:listing)
  end
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

def entity_relationship_diagram
  generate_entity_relationship_diagram
  erb(:entity_relationship_diagram)
end

def generate_entity_relationship_diagram
  domain = RailsERD::Domain.new(
      ActiveRecord::Base.descendants,
      # No entities should be missing because all desendents are in domain.
      warn: true
  )

  Dir.mktmpdir { |directory|
    filename = File.join(directory, '_index.erd')
    diagram = ::Metasploit::ERD::Diagram.new(
        domain,
        filename: filename,
        title: 'Entity-Relationship Diagram'
    )
    temporary_path = diagram.create

    content = File.read(temporary_path)
    asset_path = File.join('images', "_index.erd.#{diagram.send(:filetype)}")
    asset(asset_path, content)
  }
end