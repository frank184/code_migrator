require 'optparse'

module CodeMigrator
  class Cli
    def self.parse(options)
      options = ['-h'] if options.empty?
  
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: code_migrator --rules=<rules.json>"
  
        opts.on("-rRULES", "--rules=RULES", "JSON rules list") do |rules|
          worker = Worker.new(rules)
          worker.write
        end

        opts.on("-v", "--version", "Prints version") do
          puts "code_migrator v#{CodeMigrator::VERSION}"
        end
  
        opts.on("-h", "--help", "Prints help") do
          puts opts
          exit
        end
      end
  
      opt_parser.parse!(options)
    end
  end
end