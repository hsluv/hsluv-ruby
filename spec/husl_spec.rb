require 'spec_helper'
require 'json'

describe Husl do

  def deviation a, b
    a.zip(b).map! { |group|  group.inject(:-).abs < 1e-11 }.uniq == [true]
  end

  describe 'snapshot' do
    snapshot = JSON.parse(File.read("spec/fixtures/snapshot-rev3.json"))

    snapshot.each do |block|
      hex = block.first
      values = block[-1]

      test_rgb = values["rgb"]
      test_xyz = values["xyz"]
      test_luv = values["luv"]
      test_lch = values["lch"]
      test_husl = values["husl"]
      test_huslp = values["huslp"]

      context "should convert #{hex}" do
        it "from rgb to xyz" do
          expect(deviation(Husl.rgb_to_xyz(test_rgb), test_xyz)).to eq true
        end

        it "from xyz to luv" do
          expect(deviation(Husl.xyz_to_luv(test_xyz), test_luv)).to eq true
        end

        it "from luv to lch" do
          expect(deviation(Husl.luv_to_lch(test_luv), test_lch)).to eq true
        end

        it "from lch to husl" do
          expect(deviation(Husl.lch_to_husl(test_lch), test_husl)).to eq true
        end

        it "from lch to huslp" do
          expect(deviation(Husl.lch_to_huslp(test_lch), test_huslp)).to eq true
        end
      end

    end
  end
end
