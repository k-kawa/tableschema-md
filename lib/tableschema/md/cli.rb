require "hanami/cli"
require 'erubis'

module Tableschema
  module Md
    module Cli
      extend Hanami::CLI::Registry

      class Version < Hanami::CLI::Command
        desc "Print version"

        def call(**options)
          puts Tableschema::Md::VERSION
        end
      end
      register "version", Version, aliases: ["v", "-v", "--version"]

      class Validate < Hanami::CLI::Command
        desc "Validate schema"
        argument :input, desc: "Schema file", required: true

        def call(input:, **options)
          s = TableSchema::Schema.new(JSON.parse(open(input).read))
          unless s.validate
            s.errors.each do |e|
              puts e
            end
          end
        end
      end
      register "validate", Validate

      class Render < Hanami::CLI::Command
        desc "Make document"
        argument :input, desc: "Schema file", required: true
        option :template, desc: "template"

        def call(input:, **options)
          s = TableSchema::Schema.new(JSON.parse(open(input).read))
          abs_path = File.expand_path(get_base_path+"/templates/schema.md.erb")
          puts Erubis::Eruby.new(File.read(abs_path)).result(schema: s)
        end

        def get_base_path()
          File.dirname(__FILE__)
        end
      end
      register "render", Render

    end
  end
end
