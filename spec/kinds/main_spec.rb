describe Towsta::Kinds::MainKind do

  subject { Towsta::Kinds::MainKind.new "Test String"}

  its(:get) { should == 'Test String'}

  it 'unescapes on set' do
    subject.set "\'"
    subject.get.should == "'"
  end

  it 'compares two equal objects' do
    subject.compare('Test String').should == true
  end

  it 'compares two different objects' do
    subject.compare('Other String').should == false
  end

  its(:export) {should == 'Test String'}

  its(:kind) {should == 'main'}

end
