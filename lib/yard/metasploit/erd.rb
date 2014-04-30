#
# Gems
#

require 'yard'

#
# Project
#

require 'yard/metasploit/erd/version'

# namespace inherited from `yard` gem itself
module YARD
  # namespace to match primary gem, `metasploit-erd`, that is used by this yard plugin.
  module Metasploit
    # namespace to match primary gem, `metasploit-erd`, that is used by this yard plugin.
    module ERD
      # Registers {templates} in `YARD::Templates::Engine.templates_paths`.
      #
      # @return [void]
      def self.register_template_path
        YARD::Templates::Engine.register_template_path templates.to_path
      end

      # The root directory of the yard-metasploit-erd gem.
      #
      # @return [Pathname]
      def self.root
        @root ||= Pathname.new(__FILE__).parent.parent.parent.parent
      end

      # Path to the YARD templates for this YARD plugin.
      #
      # @return [Pathname]
      def self.templates
        root.join('templates')
      end
    end
  end
end

YARD::Metasploit::ERD.register_template_path
