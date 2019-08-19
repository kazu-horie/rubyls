RSpec.describe Rubyls do
  describe '.ls' do
    it 'return entries' do
      allow(Dir).to receive(:entries).and_return(['.', '..', 'dir', 'file'])
      expect(Rubyls.ls(path: '.')).to eq "dir\tfile\n"
    end

    it 'return sorted entries' do
      allow(Dir).to receive(:entries).and_return(['.', '..', 'file', 'dir'])
      expect(Rubyls.ls(path: '.')).to eq "dir\tfile\n"
    end

    it 'return entries with no arguments' do
      allow(Dir).to receive(:entries).and_return(['.', '..', 'dir', 'file'])
      expect(Rubyls.ls).to eq "dir\tfile\n"
    end

    it 'throw ArgumentError when path does not exist' do
      expect { Rubyls.ls('nonexistent path') }.to raise_error(ArgumentError)
    end
  end
end
