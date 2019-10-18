require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def setup
    @mm = Mastermind.new
    @mm_known = Mastermind.new(["r", "b", "g", "g"])
    @guesses = 0
  end

  def test_initialization
    assert_instance_of Mastermind, @mm
    assert @mm.code
  end

  def test_generate_code
    assert_equal 4, @mm.code.length
    refute @mm.code.include?("a")
    refute @mm.code.include?("c".."f")
    refute @mm.code.include?("h".."q")
    refute @mm.code.include?("s".."x")
    refute @mm.code.include?("z")
  end

  def test_correct_positions
    assert_equal 0, @mm.guess("aaaa")[1]
    assert_equal 4, @mm.guess(@mm.code.join)[1]

    assert_equal 1, @mm_known.guess("grbg")[1]
    assert_equal 2, @mm_known.guess("brgg")[1]
    assert_equal 3, @mm_known.guess("gbgg")[1]
  end

  def test_total_correct
    assert_equal 0, @mm.guess("aaaa")[0]
    assert_equal 4, @mm.guess(@mm.code.join)[0]

    assert_equal 1, @mm_known.guess("yyyr")[0]
    assert_equal 2, @mm_known.guess("ggyy")[0]
    assert_equal 3, @mm_known.guess("bggy")[0]
  end

  def test_increment_guesses
    @mm.add_guess
    assert_equal 1, @mm.guesses

    @mm.add_guess
    assert_equal 2, @mm.guesses
    @mm.add_guess
    assert_equal 3, @mm.guesses
  end
end
