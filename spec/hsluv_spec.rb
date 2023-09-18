require 'helpers'
require 'spec_helper'
require 'json'

describe Hsluv do

  describe 'snapshot' do
    snapshot = JSON.parse(File.read('spec/fixtures/snapshot-rev4.json'))

    snapshot.each do |block|
      hex = block.first
      values = block[-1]

      test_rgb = values['rgb']
      test_xyz = values['xyz']
      test_luv = values['luv']
      test_lch = values['lch']
      test_hsluv = values['hsluv']
      test_hpluv = values['hpluv']


      context "should convert #{hex}" do
        # Forward

        it 'from rgb to xyz' do
          expect(deviation(Hsluv.rgb_to_xyz(test_rgb), test_xyz)).to eq true
        end

        it 'from xyz to luv' do
          expect(deviation(Hsluv.xyz_to_luv(test_xyz), test_luv)).to eq true
        end

        it 'from luv to lch' do
          expect(deviation(Hsluv.luv_to_lch(test_luv), test_lch)).to eq true
        end

        it 'from lch to hsluv' do
          expect(deviation(Hsluv.lch_to_hsluv(test_lch), test_hsluv)).to eq true
        end

        it 'from lch to hpluv' do
          expect(deviation(Hsluv.lch_to_hpluv(test_lch), test_hpluv)).to eq true
        end

        # Backward
        it 'from hpluv to lch' do
          expect(deviation(Hsluv.hpluv_to_lch(test_hpluv), test_lch)).to eq true
        end

        it 'from hsluv to lch' do
          expect(deviation(Hsluv.hsluv_to_lch(test_hsluv), test_lch)).to eq true
        end

        it 'from lch to luv' do
          expect(deviation(Hsluv.lch_to_luv(test_lch), test_luv)).to eq true
        end

        it 'from luv to xyz' do
          expect(deviation(Hsluv.luv_to_xyz(test_luv), test_xyz)).to eq true
        end

        it 'from xyz to rgb' do
          expect(deviation(Hsluv.xyz_to_rgb(test_xyz), test_rgb)).to eq true
        end

        # Others
        it 'from hsluv to hex' do
          expect(Hsluv.hsluv_to_hex(*test_hsluv)).to eq hex
        end

        it 'from hpluv to hex' do
          expect(Hsluv.hpluv_to_hex(*test_hpluv)).to eq hex
        end

        it 'from hex to hsluv' do
          expect(deviation(Hsluv.hex_to_hsluv(hex), test_hsluv)).to eq true
        end

        it 'from hex to hpluv' do
          expect(deviation(Hsluv.hex_to_hpluv(hex), test_hpluv)).to eq true
        end
      end

    end
  end
end
