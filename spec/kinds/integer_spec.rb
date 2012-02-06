describe Towsta::Kinds::IntegerKind do

  context 'when sets with numeric string' do

    subject {Towsta::Kinds::IntegerKind.new '1'}

    its(:get) {should == 1}

    its(:export) {should == '1'}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::IntegerKind.new 'Bad String'}

    its(:get) {should be_zero}

    its(:export) {should == '0'}

  end

  context 'when sets with a integer' do

    subject {Towsta::Kinds::IntegerKind.new 1}

    its(:get) {should == 1}

    its(:export) {should == '1'}

  end

end
