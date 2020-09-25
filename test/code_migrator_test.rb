require "test_helper"

class CodeMigratorTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CodeMigrator::VERSION
  end
end
