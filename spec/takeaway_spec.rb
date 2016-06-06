describe 'Takeaway' do

  subject(:takeaway){Takeaway.new}

  it 'displays menu with dishes and prices' do
    expect(takeaway).to respond_to(:view_menu)
  end
end
