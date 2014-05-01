#
# Gems
#

require 'metasploit/erd'

def active_record?
  inheritance_tree = object.inheritance_tree
  inheritance_titles = inheritance_tree.map(&:title)

  inheritance_titles.include? 'ActiveRecord::Base'
end

def entity
  unless @entity
    if active_record?
      klass = object.title.constantize
      @entity = ::Metasploit::ERD::Entity::Class.new(klass)
    else
      super
    end
  end

  @entity
end
