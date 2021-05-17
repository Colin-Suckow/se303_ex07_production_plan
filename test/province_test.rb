gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  def setup
    @asia = Province.new(sample_province_data)
  end

  def test_province_shortfall
    assert_equal(5, @asia.shortfall)
  end

  def test_province_profit
    assert_equal(230, @asia.profit)
  end

  def test_province_change_production
    @asia.producers[0].production = 20
    assert_equal(-6, @asia.shortfall)
    assert_equal(292, @asia.profit)
  end

  describe "no producers" do
    before do
      data = {
        name: "No producers",
        producers: [],
        demand: 30,
        price: 20
      }
      @noProducers = Province.new(data)
    end

    it "shortfall" do
      assert_equal(30, @noProducers.shortfall)
    end
  end

end
