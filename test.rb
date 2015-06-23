gem 'test-unit'
require 'test/unit'
require_relative 'lib/micro_factory'

class Stooge
  attr_accessor :name, :occupation, :saved

  def initialize(attributes)
    @saved = false
    attributes.each {|k, v| send("#{k}=", v)}
  end

  def save!
    @saved = true
  end
end

class MicroFactoryTest < Test::Unit::TestCase
  def setup
    @mod = Module.new
    @mod.extend MicroFactory
    @mod.extend @mod
    @mod.factory :Stooge, name: 'Moe Howard', occupation: 'Actor'
  end

  def test_adds_methods_to_module
    assert_equal [:build_stooge, :create_stooge, :valid_stooge_attributes], @mod.public_instance_methods
  end

  def test_valid_attributes
    assert_equal({name: 'Moe Howard', occupation: 'Actor'}, @mod.valid_stooge_attributes)
  end

  def test_build
    stooge = @mod.build_stooge name: 'Larry Fine'
    assert_equal 'Larry Fine', stooge.name
    assert_equal 'Actor', stooge.occupation
  end

  def test_create
    stooge = @mod.create_stooge
    assert stooge.saved
  end
end