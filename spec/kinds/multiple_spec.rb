describe Towsta::Kinds::MultipleKind do

  let(:input) {'1 2'}

  before(:all){
    Towsta::Vertical.clear
    Towsta::Vertical.create name: 'Dog', slices: {id: 'integer'}
    Towsta::Vertical.populate 'Dog', [{id: 1}, {id: 2}]
  }

  context 'when sets with string' do

    subject {Towsta::Kinds::MultipleKind.new input}

    its(:get) {should == Dog.all}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::MultipleKind.new 'Bad String'}

    its(:get) {should == []}

    its(:export) {should == ''}

  end

  context 'when sets with a Multiple' do

    subject {Towsta::Kinds::MultipleKind.new Dog.all}

    its(:get) {should == Dog.all}

    its(:export) {should == input}

  end

end
