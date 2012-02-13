describe Towsta::Vertical do

  before :all do
    Towsta::Vertical.clear
    Towsta::Vertical.create name: 'Dog', slices: {id: 'integer', name: 'text'}
    Towsta::Vertical.populate 'Dog', [{id: '1', name: 'Bandita'}]
  end

  it 'responds with an array to :all' do
    Towsta::Vertical.all.class.should == Array
  end

  it 'populates the class' do
    Dog.all.should_not be_empty
  end

end
