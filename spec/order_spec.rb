describe Order do
  subject(:order){described_class.new}

  let(:dishes) do
    {
      burger: 2,
      chips: 1
    }
  end

  it 'selects several dishes from the menu' do
    order.add(:burger, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq(dishes)
  end
end
