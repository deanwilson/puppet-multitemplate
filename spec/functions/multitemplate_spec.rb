require 'spec_helper'

describe 'multitemplate' do

  ############### Test normal usage

  describe 'when a single template is specified' do
    it 'should return the contents of the given template' do
      should run.with_params( 'single_match/hello.erb' ).and_return( 'Hello World' )
    end
  end

  describe 'when multiple templates are specified' do
    it 'should return the contents of the first existing one' do
      should run.with_params( 'single_match/nosuch.erb', 'single_match/hello.erb' ).and_return( 'Hello World' )
    end
  end
      
  ############### Test error conditions

  describe 'handling expected error conditions' do
    it 'should throw Puppet::ParseError if called with no templates' do
      should run.with_params( ).and_raise_error(Puppet::ParseError)
    end

    it 'should throw Puppet::ParseError when given an invalid template' do
      should run.with_params('invalid_template/invalid.erb' ).and_raise_error(Puppet::ParseError)
    end

    it 'should throw Puppet::ParseError if no given templates exist' do
      should run.with_params( 'invalid_template/nosuch.erb' ).and_raise_error(Puppet::ParseError)
    end
  end
end 
