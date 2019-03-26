require "test_helper"

class Pronto::PrettierTest < Minitest::Test
  def setup
    @repo = Pronto::Git::Repository.new("../dummy")
  end

  def test_that_it_has_a_version_number
    refute_nil ::Pronto::Prettier::VERSION
  end

  def test_checks_for_prettier_errors
    assert false
  end
end
