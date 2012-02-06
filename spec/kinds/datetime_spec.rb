describe Towsta::Kinds::DatetimeKind do

  let(:input) {'10/16/1992 00:00'}
  let(:format) {'%m/%d/%Y %H:%M'}
  let(:datetime) {DateTime.strptime(input, format).to_time}

  context 'when sets with %m/%d/%Y %H:%M' do

    subject {Towsta::Kinds::DatetimeKind.new input}

    its(:get) {should == datetime}

    #its(:export) {should == input}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::DatetimeKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a DateTime' do

    subject {Towsta::Kinds::DatetimeKind.new datetime}

    its(:get) {should == datetime}

    #its(:export) {should == input}

  end

end
