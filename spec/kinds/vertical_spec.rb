describe Towsta::Kinds::VerticalKind do

  let(:input) {'1'}

  before(:all){
    Towsta::Vertical.clear
    Towsta::Vertical.create name: 'Cat', slices: {id: 'integer'}
    Towsta::Vertical.populate 'Cat', [{id: 1}]
  }

  context 'when sets with string' do

    subject {Towsta::Kinds::VerticalKind.new input}

    its(:get) {should == Cat.first}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::VerticalKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a Cat' do

    subject {Towsta::Kinds::VerticalKind.new Cat.first}

    its(:get) {should == Cat.first}

    its(:export) {should == input}

  end

end
