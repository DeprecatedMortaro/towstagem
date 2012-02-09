describe Towsta::Synchronizer do

  describe '#remote_string' do

    subject {Towsta::Synchronizer.new}

    context 'when towsta responds correctly' do

      before(:all) {Net::HTTP.stub(:start).and_return(File.read('./spec/webmock.json'))}

      its(:remote_string) {should be_true}

    end

    context 'when response fails' do

      before(:all) {Net::HTTP.stub(:start).and_raise('Something wrong with towsta')}

      its(:remote_string) {should_not be_true}

    end

  end

end
