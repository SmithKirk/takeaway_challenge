
describe 'Menu' do

  let(:menu){Menu.new}


  it 'allows new dishes to be added' do
    menu.add_dish(:burger, 3.00)
    expect(menu.dishes).to include(:burger => 3.00)
  end

  it 'allows dishes to be removed from menu' do
    menu.add_dish(:burger, 3.00)
    menu.remove_dish(:burger)
    expect(menu.dishes).to_not include(:burger)
  end
end
