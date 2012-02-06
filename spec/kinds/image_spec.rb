describe Towsta::Kinds::ImageKind do

  let(:input) {{reference: 'upload', source: 'URLImage', link: 'mypicture.png'}}

  let(:json) {"(#{input.to_json})"}

  let(:image){Bresson::ImageReference.new input}

  context 'when sets with json' do

    subject {Towsta::Kinds::ImageKind.new json}

    #its(:get) {should == image}

    its(:export) {should == json}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::ImageKind.new 'Bad String'}

    its(:get) {should be_nil}

    its(:export) {should be_blank}

  end

  context 'when sets with a Image' do

    subject {Towsta::Kinds::ImageKind.new image}

    its(:get) {should == image}

    its(:export) {should == json}

  end

end
