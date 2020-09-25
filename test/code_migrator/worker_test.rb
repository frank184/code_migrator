require "test_helper"

class CodeMigrator::RulesLoaderTest < Minitest::Test
  def setup
    @file = 'test/dummy.json'
    @json = JSON.parse(File.read(@file))
    @worker = CodeMigrator::Worker.new(@file)
    File.write('test/dummy/test.txt', 'Hello World')
  end

  def test_initialize
    expect = @json.first
    actual = @worker.rules.first

    assert_equal expect['regex'], actual.regex
    assert_equal expect['replace'], actual.replace
    assert_equal expect['include'], actual.include
    assert_equal expect['exclude'], actual.exclude
  end

  def test_write_rules
    expect = "Hello Code Migrator"
    @worker.write
    actual = File.read('test/dummy/test.txt')

    assert_equal expect, actual
  end
end
