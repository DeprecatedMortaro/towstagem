describe Towsta::Kinds::MoneyKind do

  let(:input) {'1.000,00'}

  let(:money){1_000.00}

  context 'when sets with string' do

    subject {Towsta::Kinds::MoneyKind.new input}

    its(:get) {should == money}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::MoneyKind.new 'Bad String'}

    its(:get) {should be_zero}

    its(:export) {should == '0'}

  end

  context 'when sets with a Float' do

    subject {Towsta::Kinds::MoneyKind.new input}

    its(:get) {should == money}

    its(:export) {should == input}

  end

end
