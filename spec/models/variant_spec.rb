require 'rails_helper'

describe Variant do
  let!(:variant) { create(:variant) }

  context 'product has other variants' do
    describe 'option value accessors' do
      before do
        @multi_variant = FactoryBot.create :variant, product: variant.product
        variant.product.reload
      end

      let(:multi_variant) { @multi_variant }

      it 'should set option value' do
        expect(multi_variant.option_value('media_type')).to be_nil

        multi_variant.set_option_value('media_type', 'DVD')
        expect(multi_variant.option_value('media_type')).to eql 'DVD'

        multi_variant.set_option_value('media_type', 'CD')
        expect(multi_variant.option_value('media_type')).to eql 'CD'
      end

      it 'should not duplicate associated option values when set multiple times' do
        multi_variant.set_option_value('media_type', 'CD')

        expect do
          multi_variant.set_option_value('media_type', 'DVD')
        end.to_not change(multi_variant.option_values, :count)

        expect do
          multi_variant.set_option_value('coolness_type', 'awesome')
        end.to change(multi_variant.option_values, :count).by(1)
      end
    end
  end
end
