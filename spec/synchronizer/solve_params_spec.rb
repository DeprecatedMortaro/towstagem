describe Towsta::Synchronizer do

  describe "#solve_params" do

    subject{ Towsta::Synchronizer.new}

    let(:input) {{lorem: 'ipsum'}}

    context 'when Towsta.global is nil' do

      it 'returns the param itself' do
        subject.send(:solve_params, input).should == input
      end

    end

    context 'when Towsta.global is set' do

      it 'merges with params' do
        Towsta.global = {lorem: 'another ipsum', dolor: 'sit'}
        subject.send(:solve_params, input).should == {lorem: 'ipsum', dolor: 'sit'}
      end

    end

  end

end
