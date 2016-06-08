
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
end
