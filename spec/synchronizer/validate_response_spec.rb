describe Towsta::Synchronizer do

  describe '#validate_response' do

    subject {Towsta::Synchronizer.new}

    context 'when response is valid' do

      before(:each) {subject.response = '{"status":"true"}'}

      its(:validate_response) {should be_true}

    end

    context 'when response is invalid' do

      before(:each) {subject.response = ''}

      its(:validate_response) {should_not be_true}

    end

  end

end
