describe Towsta::Synchronizer do

  before(:all) {Net::HTTP.stub(:start).and_return(File.read('./spec/webmock.json'))}
  before(:all) {Towsta::Synchronizer.new(params: {}, request: :all)}

  describe '#create_verticals' do

    it 'creates User class' do
      Object.const_defined?(:User).should be_true
    end

  end

  describe '#populate_verticals' do

    it 'populates Users' do
      User.all.should_not be_empty
    end

  end

end
