require 'json'
require 'code_migrator/rule'

module CodeMigrator
  class Worker
    attr_reader :rules

    def initialize(path)
      file = File.read(path)
      json = JSON.parse(file, symbolize_names: true)
      @rules = json.is_a?(Array) ? json.map { |rule| Rule.new(rule) } : [ Rule.new(json) ]
    end

    def write
      rules.each(&:write)
    end
  end
end
