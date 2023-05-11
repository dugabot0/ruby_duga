# frozen_string_literal: true

require "test_helper"

class TestRubyDuga < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubyDuga::VERSION
  end

  def test_search
    cli = RubyDuga.new
    response = cli.search(keyword: "天使もえ", adult: 0)
    response.body[:items].each do |i|
      puts i[:item][:title]
    end
    assert true
  end
end
