describe Towsta::Kinds::DateKind do

  let(:input) {'10/16/1992'}
  let(:format) {'%m/%d/%Y'}
  let(:date) {DateTime.strptime('10/16/1992', '%m/%d/%Y')}

  context 'when sets with %m/%d/%Y' do

    subject {Towsta::Kinds::DateKind.new input}

    its(:get) {should == date}

    its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::DateKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a DateTime' do

    subject {Towsta::Kinds::DateKind.new date}

    its(:get) {should == date}

    its(:export) {should == input}

  end

end
