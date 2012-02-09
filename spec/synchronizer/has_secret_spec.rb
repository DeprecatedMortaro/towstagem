describe Towsta::Synchronizer do

  describe '#has_secret' do

    subject {Towsta::Synchronizer.new}

    context 'when secret is set' do

      before(:each) {Towsta.secret = 'somesecretstring'}

      its(:has_secret) {should be_true}

    end

    context 'when secret is nil' do

      before(:each) {Towsta.secret = nil}

      its(:has_secret) {should_not be_true}

    end

  end

end
