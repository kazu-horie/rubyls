RSpec.describe Rubyls do
  it "has a version number" do
    expect(Rubyls::VERSION).not_to be nil
  end

  it "output entries within current dir" do
    expected = output(`ls .`.gsub(/\n/, "\t") + "\n").to_stdout
    expect { Rubyls.ls('.') }.to expected
  end
end
