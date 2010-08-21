require 'spec_helper'
require 'do-schema/support/ordered_set'

describe 'DataObjects::Schema::OrderedSet#initialize' do

  context 'when no entries are given' do

    subject { DataObjects::Schema::OrderedSet.new }

    it { should be_empty }

    its(:length) { should == 0 }

  end

  context 'when entries are given' do

    subject { DataObjects::Schema::OrderedSet.new(entries) }

    context 'and they do not contain duplicates' do

      let(:entries) { [2,1] }

      it { should_not be_empty }
      it { should include(1)   }
      it { should include(2)   }

      its(:length)  { should ==   2   }
      its(:entries) { should == [2,1] }

      it 'should retain insertion order' do
        subject.index(1).should == 1
        subject.index(2).should == 0
      end

    end

    context 'and they contain duplicates' do

      let(:entries) { [1,1] }

      it { should_not be_empty }
      it { should include(1)   }

      its(:length)  { should ==  1  }
      its(:entries) { should == [1] }

    end

  end

end

