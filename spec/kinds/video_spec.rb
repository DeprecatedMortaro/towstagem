describe Towsta::Kinds::VideoKind do

  let(:input) {{id: '2PuD3XrF9Hg', source: 'YouTube'}}

  let(:video) {Cameraman::VideoReference.new input}

  context 'when sets with string' do

    subject {Towsta::Kinds::VideoKind.new input.to_json}

    #its(:get) {should == video}

    its(:export) {should == input.to_json}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::VideoKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a User' do

    subject {Towsta::Kinds::VideoKind.new video}

    its(:get) {should == video}

    its(:export) {should == input.to_json}

  end

end
