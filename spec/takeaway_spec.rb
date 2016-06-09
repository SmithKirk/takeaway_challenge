describe Takeaway do

  subject(:takeaway){described_class.new(menu: menu, order: order)}

  let(:menu){double(:menu, print_menu: printed_menu)}
  let(:order){double(:order)}
  let(:printed_menu){'Burger £3.00, Chips £1.50'}

  describe '#view_menu' do

    it 'responds to menu' do
      expect(takeaway).to respond_to(:view_menu)
    end

    it 'shows the menu with dishes and prices' do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do
    xit 'will select some number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end



end
