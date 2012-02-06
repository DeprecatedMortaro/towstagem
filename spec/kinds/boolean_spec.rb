describe Towsta::Kinds::BooleanKind do

  context 'when sets with "1"' do

    subject {Towsta::Kinds::BooleanKind.new '1'}

    its(:get) {should == true}

    its(:export) {should == '1'}

  end

  context 'when sets with "0"' do

    subject {Towsta::Kinds::BooleanKind.new '0'}

    its(:get) {should == false}

    its(:export) {should == '0'}

  end

  context 'when sets with "Test String"' do

    subject {Towsta::Kinds::BooleanKind.new 'Test String'}

    its(:get) {should == false}

    its(:export) {should == '0'}

  end

  context 'when sets with True' do

    subject {Towsta::Kinds::BooleanKind.new true}

    its(:get) {should == true}

    its(:export) {should == '1'}

  end

  context 'when sets with False' do

    subject {Towsta::Kinds::BooleanKind.new false}

    its(:get) {should == false}

    its(:export) {should == '0'}

  end

end

