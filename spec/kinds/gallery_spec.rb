describe Towsta::Kinds::GalleryKind do

  let(:input) {[
    {reference: 'upload', source: 'URLImage', link: 'mypicture.png'},
    {reference: 'upload', source: 'URLImage', link: 'otherpicture.png'}
  ]}

  let(:gallery){[
    Bresson::ImageReference.new(input.first),
    Bresson::ImageReference.new(input.last)
  ]}

  context 'when sets with json' do

    subject {Towsta::Kinds::GalleryKind.new input.to_json}

    #its(:get) {should == gallery}

    its(:export) {should == input.to_json}

  end

  context 'when sets with a bad string' do

    subject {Towsta::Kinds::GalleryKind.new 'Bad String'}

    its(:get) {should == []}

    its(:export) {should be_blank}

  end

  context 'when sets with a Gallery' do

    subject {Towsta::Kinds::GalleryKind.new gallery}

    its(:get) {should == gallery}

    its(:export) {should == input.to_json}

  end

end
