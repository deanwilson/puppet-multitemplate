require 'spec_helper'

describe 'multitemplate' do
  ############### Test normal usage

  describe 'when a single template is specified' do
    it 'returns the contents of the given template' do
      is_expected.to run.with_params('single_match/hello.erb').and_return('Hello World')
    end
  end

  describe 'when multiple templates are specified' do
    it 'returns the contents of the first existing one' do
      is_expected.to run.with_params('single_match/nosuch.erb', 'single_match/hello.erb').and_return('Hello World')
    end
  end

  ############### Test error conditions

  describe 'handling expected error conditions' do
    it 'throws Puppet::ParseError if called with no templates' do
      is_expected.to run.with_params.and_raise_error(Puppet::ParseError)
    end

    it 'throws Puppet::ParseError when given an invalid template' do
      is_expected.to run.with_params('invalid_template/invalid.erb').and_raise_error(Puppet::ParseError)
    end

    it 'throws Puppet::ParseError if no given templates exist' do
      is_expected.to run.with_params('invalid_template/nosuch.erb').and_raise_error(Puppet::ParseError)
    end
  end
end
