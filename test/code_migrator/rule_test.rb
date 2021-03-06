require "test_helper"

class CodeMigrator::RuleTest < Minitest::Test
  def setup
    @file = 'test/dummy.json'
    @json = JSON.parse(File.read(@file), symbolize_names: true)
    @worker = CodeMigrator::Worker.new(@file)
  end

  def test_initialize
    expect = @json.first
    actual = @worker.rules.first

    assert_equal expect[:regex], actual.regex
    assert_equal expect[:replace], actual.replace
    assert_equal expect[:include], actual.include
    assert_equal expect[:exclude], actual.exclude
  end

  def test_files
    expect = ["test/dummy/test.txt"]

    @worker.rules.each do |rule|
      assert expect, rule.files
    end
  end
end
