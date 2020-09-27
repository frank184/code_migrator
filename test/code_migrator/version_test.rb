require "test_helper"

class CodeMigrator::VersionTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CodeMigrator::VERSION
  end
end
