require '../lib/hash_keys_rename'

describe Hash do
  context 'simple hash' do
    subject {  {old_key_a: 1, old_key_b: 2}  }
    let(:with) { {:old_key_a => :new_key_a, :old_key_b => :new_key_b} }
    let(:result){ {new_key_a: 1, new_key_b: 2} }
    it { expect(subject.deep_rename with).to eql result }
  end

  context 'nested hash' do
    subject {  {old_key_a: 1, old_key_b: {old_key_c: 3, no_rename: 4}}  }
    let(:with) { {:old_key_a => :new_key_a, :old_key_b => {:new_key_b => {:old_key_c => :new_key_c}}} }
    let(:result) { {:new_key_a=>1, :new_key_b=>{:new_key_c=>3, :no_rename=>4}} }
    it { expect(subject.deep_rename with).to eql result }
  end

  context 'hash with array' do
    subject {  {old_key_a: [{old_key_b: 1, old_key_c: 2}, {old_key_b: 1, old_key_c: 2}]}  }
    let(:with) {  {old_key_a: {:new_key_a => {:old_key_b => :new_key_b, :old_key_c => :new_key_c}}}  }
    let(:result) { {:new_key_a=>[{:new_key_b=>1, :new_key_c=>2}, {:new_key_b=>1, :new_key_c=>2}]}  }
    it { expect(subject.deep_rename with).to eql result }
  end

  context 'short form' do
    subject {  {old_key_a: 1, no_rename: {old_key_c: 3, no_rename: 4}}  }
    let(:with) {  {:old_key_a => :new_key_a, :no_rename => {:old_key_c => :new_key_c}}  }
    let(:result){  {:new_key_a=>1, :no_rename=>{:new_key_c=>3, :no_rename=>4}}  }
    it { expect(subject.deep_rename with).to eql result }
  end

end

describe Array do
  context 'array with hashes' do
    subject { [{old_key_a: 1, old_key_b: 2}, {old_key_a: 1, old_key_b: 2}] }
    let(:with) { {:old_key_a => :new_key_a, :old_key_b => :new_key_b} }
    let(:result){ [{new_key_a: 1, new_key_b: 2},{new_key_a: 1, new_key_b: 2}] }
    it { expect(subject.deep_rename with).to eql result }
  end

  context 'array with different values' do
    subject { [{old_key_a: 1, old_key_b: 2}, 2] }
    let(:with) { {:old_key_a => :new_key_a, :old_key_b => :new_key_b} }
    let(:result){ [{new_key_a: 1, new_key_b: 2}, 2] }
    it { expect(subject.deep_rename with).to eql result }
  end
end