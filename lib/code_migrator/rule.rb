class Rule
  attr_accessor :regex, :replace, :include, :exclude

  def initialize(opts)
    @regex = opts[:regex]
    @replace = opts[:replace]
    @include = opts[:include]
    @exclude = opts[:exclude]
  end

  def write
    pattern = Regexp.new(regex)
    files.each do |file|
      old_file = File.read(file)
      new_file = old_file.gsub(pattern, replace)
      File.write(file, new_file)
    end
  end

  def files
    fetch_files(include) - fetch_files(exclude)
  end

  private

    def fetch_files(globs)
      Dir[*globs.split(/, ?/)].select { |f| File.file?(f) }
    end
end