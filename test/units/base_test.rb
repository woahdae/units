require File.dirname(__FILE__) + '/../test_helper'

class BaseTest < Test::Unit::TestCase
  def setup
    @num1 = 1234.5678
    @num2 = 9876.5432

    [@num1, @num2].each do |n|
      n.instance_eval do
        self.class.add_unit_conversions(
          :test_kind => {
            :bases    => 1.0,
            :biggers  => 10.0
          },
          :bad_kind => {
            :flavors    => 1.0,
          }
        ) 
        self.class.add_unit_aliases(
          :test_kind => {
            :bases =>   [ :base   ],
            :biggers => [ :bigger ]
          }
        )
      end
    end
  end
  
	def test_add_unit_conversions
	  assert_equal :test_kind, @num1.to_bases.kind
	  assert_equal :bad_kind, @num2.flavors.kind
	  assert_equal :bases, @num1.to_bases.unit
	  assert_equal :bases, @num1.to_bases.to_bases.unit
	  assert_equal :biggers, @num2.to_biggers.unit
	end
	
	def test_add_unit_aliases
	  assert_equal :bases, @num1.to_base.unit
	  assert_equal :biggers, @num2.to_bigger.unit
  end
  
  def test_adding
    assert_equal 11111.111, @num1 + @num2
    assert_equal 11111.111, @num2 + @num1
    
    assert_equal 99999.9998, @num1.to_base + @num2.to_biggers
    assert_equal 22222.2212, @num2.to_base + @num1.to_biggers
    
    assert_equal :bases, (@num1.to_base + @num2.to_biggers).units
    assert_equal :biggers, (@num1.to_biggers + @num2.to_bases).units
    
    assert_raise(UnitsError) { @num1.to_base + 2 }
    assert_raise(UnitsError) { 5 + @num1.to_base }
    assert_raise(UnitsError) { @num1.to_base + 2.0 }
    assert_raise(UnitsError) { 5.0 + @num1.to_base }
  end

  def test_multiplying
    assert_equal 2469.1356, @num1 * 2
    assert_equal 2469.1356, @num1.to_base * 2
    assert_equal nil, (@num1 * 2).units
    assert_equal :bases, (@num1.to_base * 2).units
    
    assert_raise(UnitsError) { @num1.to_base * @num2.to_base }
    assert_raise(TypeError) { @num1.to_base * "string" }
    assert_raise(UnitsError) { "string" * @num1.to_base }
    assert_equal "stringstringstring", "string" * 3.0
  end

end