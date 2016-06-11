
describe Menu do

  subject(:menu){described_class.new(dishes)}
  let(:dishes)do
    {
      burger: 3.00,
      chips: 1.50
    }
  end

  describe '#add_dish' do
    it 'adds new dish to dishes' do
      menu.add_dish(:burger, 3.00)
      menu.add_dish(:chips, 1.50)
      expect(menu.dishes).to include(dishes)
    end
  end

  describe '#has_dish?' do
    it 'checks dish is on the menu' do
      allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
      expect(menu.has_dish?(:pizza)).to eq(true)
    end

    it 'checks for dish not on the menu' do
      expect(menu.has_dish?(:pizza)).to eq(false)
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from dishes' do
      menu.remove_dish(:burger)
      expect(menu.dishes).to_not include(:burger)
    end

    it 'will raise an error if dish not found in dishes' do
      expect{menu.remove_dish(:hotdog)}.to raise_error 'Error: That dish is not on the menu'
    end
  end

  describe '#print_menu' do
    it "displays each dish alongside it\'s price" do
      expect(menu.print_menu).to eq ('Burger £3.00, Chips £1.50')
    end
  end

  describe '#price' do
    it 'gets the price of a dish' do
      expect(menu.price(:burger)).to eq(dishes[:burger])
    end
  end
end
