require File.dirname(__FILE__) + '/../test_helper'

class StandardTest < Test::Unit::TestCase
  def test_to_i
     assert_equal 10, 10.0.to_i
  end
  
  def test_to_int
     assert_equal 10, 10.0.to_int
  end
  
  def test_pounds_to_ounces
    ounces = 4.pounds.to_ounces
    assert_equal 64.0, ounces
    assert_equal :ounces, ounces.units
    assert_equal :weight, ounces.kind
  end
  
  def test_pounds_to_kilograms
    kilograms = 1.lb.to_kg
    assert_equal 0.45359237, kilograms
    assert_equal :kilograms, kilograms.units
    assert_equal :weight, kilograms.kind
  end
  
  # For some reason this test fails when comparing floats to one another
  def test_kilograms_to_pounds
    pounds = 1.kg.to_lb
    assert_equal "2.20462262184878", pounds.to_s
    assert_equal :pounds, pounds.units
    assert_equal :weight, pounds.kind
  end
  
  def test_cups_to_quarts
    quarts = 1.cup.to_quarts
    assert_equal 0.25, quarts
    assert_equal :quarts, quarts.units
    assert_equal :volume, quarts.kind
  end	
  
  def test_quarts_to_cups
    cups = 4.quarts.to_cups
    assert_equal 16.0, cups
    assert_equal :cups, cups.units
    assert_equal :volume, cups.kind
  end	
  
  def test_minutes_to_seconds
    seconds = 1.minute.to_seconds
    assert_equal 60.0, seconds
    assert_equal :seconds, seconds.unit
    assert_equal :time, seconds.kind
  end	
  
  def test_megabytes_to_kilobytes
    kilobytes = 1.mb.to_kb
    assert_equal 1024.0, kilobytes
    assert_equal :kilobytes, kilobytes.units
    assert_equal :size, kilobytes.kind
  end	
  
  def test_length
    centimeters = 1.inch.to_cm
    assert_equal 2.5400000025908, centimeters
    assert_equal :centimeters, centimeters.units
    assert_equal :length, centimeters.kind
  end
  
  def test_speed
    assert_equal 1.609344, 1.mph.to_kph
    assert_equal 1, 1.609344.kph.to_mph
    assert_equal :speed, (1.mph.to_kph).kind
  end
end