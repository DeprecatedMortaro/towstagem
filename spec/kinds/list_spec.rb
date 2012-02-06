describe Towsta::Kinds::ListKind do

  let(:input) {'some, test, string'}

  let(:list){%w{some test string}}

  context 'when sets with json' do

    subject {Towsta::Kinds::ListKind.new input}

    its(:get) {should == list}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::ListKind.new 'Bad String'}

    its(:get) {should == ['Bad String']}

    its(:export) {should == 'Bad String'}

  end

  context 'when sets with a List' do

    subject {Towsta::Kinds::ListKind.new list}

    its(:get) {should == list}

    its(:export) {should == input}

  end

end
