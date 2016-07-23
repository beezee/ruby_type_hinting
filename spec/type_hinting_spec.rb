require 'spec_helper'

class TypeHinted
  include TypeHinting

  def return_should_work
    []
  end
  return_type(:return_should_work, Array)

  def return_should_raise
    nil
  end
  return_type(:return_should_raise, Array)

  def hinted_params(a, b = 4)
    [a, b]
  end
  param_types(:hinted_params, Array, Fixnum) 
end

describe TypeHinting do
  let(:h) { TypeHinted.new }

  describe '.return_type' do

    it 'raises when method returns other than specified return type' do
      expect{h.return_should_raise}.to raise_error(TypeError)
    end

    it 'doesnt raise when method returns the specified return type' do
      expect{h.return_should_work}.to_not raise_error
    end
  end

  describe '.param_types' do
    
    it 'raises on param passed of incorrect type' do
      expect{h.hinted_params('b', 'd')}.to raise_error(TypeError)
      expect{h.hinted_params('b', 3)}.to raise_error(TypeError)
      expect{h.hinted_params(['b'], :d)}.to raise_error(TypeError)
    end

    it 'does not raise when all passed params are correct type' do
      expect{h.hinted_params([:c, :d], 5)}.to_not raise_error
      expect{h.hinted_params(['foo'])}.to_not raise_error
    end
  end
end
