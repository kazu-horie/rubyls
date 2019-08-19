RSpec.describe Rubyls do
  it "has a version number" do
    expect(Rubyls::VERSION).not_to be nil
  end

  it "output entries within current dir" do
    expected = output(`ls .`.chomp.gsub(/\n/, "\t") + "\n").to_stdout

    expect { Rubyls.ls(path: '.') }.to expected
  end

  it "output entries within current dir with no arguments" do
    expected = output(`ls .`.chomp.gsub(/\n/, "\t") + "\n").to_stdout

    expect { Rubyls.ls }.to expected
  end

  it "output error no such file or directory" do
    path = 'nonexistent name'
    expected = output("ls: #{path}: No such file or directory\n").to_stdout

    expect { Rubyls.ls(path: path) }.to expected
  end
end
