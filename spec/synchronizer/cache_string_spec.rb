describe Towsta::Synchronizer do

  describe '#cache_string' do

    subject {Towsta::Synchronizer.new}

    context 'when cache is set' do

      before(:each) {subject.cache = '{"status":"true"}'}

      its(:cache_string) {should be_true}

    end

    context 'when cache is nil' do

      before(:each) {subject.cache = nil}

      its(:cache_string) {should_not be_true}

    end

  end

end
