describe Takeaway do

  subject(:takeaway){described_class.new(menu: menu, order: order, sms: sms, config: {})}

  let(:menu){instance_double('Menu', print_menu: printed_menu)}
  let(:order){instance_double('Order', total: 10.00)}
  let(:sms){spy('SMS', deliver: nil)}
  let(:printed_menu){'Burger £3.00, Chips £1.50'}
  let(:dishes){['burger',2]}

  before do
    allow(order).to receive(:add)
  end

  describe '#view_menu' do
    it 'responds to menu' do
      expect(takeaway).to respond_to(:view_menu)
    end

    it 'shows the menu with dishes and prices' do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do
    it 'will select some number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(dishes)
    end
  end

  it 'knows order total' do
    total = takeaway.place_order(dishes)
    expect(total).to eq (10.00)
  end

  it 'sends an sms when order has been placed' do
    takeaway.place_order(dishes)
    expect(sms).to have_received(:deliver)
  end

end
