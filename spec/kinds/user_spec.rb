describe Towsta::Kinds::UserKind do

  let(:input) {'1'}

  before(:all){
    Towsta::Vertical.clear
    Towsta::Vertical.create name: 'User', slices: {id: 'integer'}
    Towsta::Vertical.populate 'User', [{id: 1}]
  }

  context 'when sets with string' do

    subject {Towsta::Kinds::UserKind.new input}

    its(:get) {should == User.first}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::UserKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a User' do

    subject {Towsta::Kinds::UserKind.new User.first}

    its(:get) {should == User.first}

    its(:export) {should == input}

  end

end
