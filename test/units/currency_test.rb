require File.dirname(__FILE__) + '/../test_helper'
begin
  require 'units/currency'
rescue => e
  # probably had a problem loading the dynamic currency thing
  $failed_currency_loading = true
end

class CurrencyTest < Test::Unit::TestCase
  if $failed_currency_loading
    def test_euro_to_dollar
      raise "Failed to load units/currency"
    end
  else
  
    def test_euro_to_dollar
      assert_equal Hash.new, Numeric.currency_rates

      assert_in_delta 1.5, 1.euro.usd, 0.5
      assert Numeric.currency_rates[:euro_to_euro] == 1.0
      assert_equal 2, Numeric.currency_rates.size
    end
    
  end
end