describe Towsta::Synchronizer do

  describe "#parse_json" do

    subject {Towsta::Synchronizer.new}

    context 'when parse a valid response' do

      before(:each) {subject.response = {lorem: 'ipsum'}.to_json}

      its(:parse_json) {should be_true}

    end

    context 'when parse a bad response' do

      before(:each) {subject.response = 'Bad Response'}

      its(:parse_json) {should_not be_true}

    end


  end

end
