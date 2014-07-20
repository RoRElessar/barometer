require_relative '../../spec_helper'

module Barometer::Query
  RSpec.describe Format::ShortZipcode do
    describe '.geo' do
      specify { expect( Format::ShortZipcode.geo(nil) ).to eq({country_code: 'US'}) }
      specify { expect( Format::ShortZipcode.geo('ignored') ).to eq({country_code: 'US'}) }
    end

    describe '.is?' do
      it 'recognizes a valid format' do
        expect( Format::ShortZipcode.is?('90210') ).to be true
      end

      it 'recognizes non-valid format' do
        expect( Format::ShortZipcode.is?('90210-5555') ).to be false
      end
    end
  end
end
