require './lib/oystercard.rb'

describe OysterCard do
  it 'tests that new cards have a balance of 0' do
    card = OysterCard.new
    expect(card.balance).to eq 0
  end

  it 'accepts a number as an argument and increases balance by that much' do
    # Arrange
    card = OysterCard.new
    amount = 10
    # Action
    # Assert
    expect(card.top_up(amount)).to eq (card.balance)
  end

  it 'limits balance to a maximum of £90' do
    # Arrange
    card = OysterCard.new
    amount = 1
    # Action
    card.top_up(90)
    # Assert
    expect{card.top_up(amount)}.to raise_error "The maximum balance has already been reached"
  end

describe '#deduct' do
  it 'deducts amount from balance' do
    #Arrange
    card = OysterCard.new
    amount = 4
    # Action
    card.top_up(10)
    # Assert
    expect(card.deduct(amount)).to eq (card.balance - amount)
  end
end

  it 'returns error if journey would reduce balance beyond 0' do
    # Arrange
    card = OysterCard.new
    amount = 4
    # Action
    card.top_up(1)
    # Assert
    expect{card.deduct(amount)}.to raise_error "You broke"
  end

  describe '#in_journey' do
    it 'returns true when method touch_in is used' do
      card = OysterCard.new
      card.touch_in
      expect(card.in_journey).to eq true
    end
    it 'returns false when method touch_out is used' do
      card = OysterCard.new
      card.touch_in
      card.touch_out
      expect(card.in_journey).to eq false
    end
  end
end
