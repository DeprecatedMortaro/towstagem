require 'spec_helper'

describe Towsta do

  describe Towsta::Kinds do

    describe Towsta::Kinds::MainKind do

      subject { Towsta::Kinds::MainKind.new "Test String"}

      its(:get) { should == 'Test String'}

      it 'unescapes on set' do
        subject.set "\'"
        subject.get.should == "'"
      end

      it 'compares two equal objects' do
        subject.compare('Test String').should == true
      end

      it 'compares two different objects' do
        subject.compare('Other String').should == false
      end

      its(:export) {should == 'Test String'}

      its(:kind) {should == 'main'}

    end

    describe Towsta::Kinds::BooleanKind do

      context 'when sets with "1"' do

        subject {Towsta::Kinds::BooleanKind.new '1'}

        its(:get) {should == true}

        its(:export) {should == '1'}

      end

      context 'when sets with "0"' do

        subject {Towsta::Kinds::BooleanKind.new '0'}

        its(:get) {should == false}

        its(:export) {should == '0'}

      end

      context 'when sets with "Test String"' do

        subject {Towsta::Kinds::BooleanKind.new 'Test String'}

        its(:get) {should == false}

        its(:export) {should == '0'}

      end

      context 'when sets with True' do

        subject {Towsta::Kinds::BooleanKind.new true}

        its(:get) {should == true}

        its(:export) {should == '1'}

      end

      context 'when sets with False' do

        subject {Towsta::Kinds::BooleanKind.new false}

        its(:get) {should == false}

        its(:export) {should == '0'}

      end

    end

  end

end
