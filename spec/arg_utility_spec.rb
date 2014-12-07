require_relative "../src/arg_utility.rb"

include ArgUtility

describe ArgUtility do
  let(:args) { ["add", "novice"] }

  it "correctly validates the program arguments" do
    sample_args = [["add", "novice"],
                   ["add", "intermediate"],
                   ["add", "advanced"],
                   ["sub", "novice"],
                   ["sub", "intermediate"],
                   ["sub", "advanced"],
                   ["mul", "novice"],
                   ["mul", "intermediate"],
                   ["mul", "advanced"],
                   ["div", "novice"],
                   ["div", "advanced"]]
    sample_args.each do |sample|
      expect(valid_args?(sample)).to be true
    end
  end

  it "recognizes invalid arguments" do
    sample_args = [["add-xx", "novice"],
                   ["khs&*&&*#939j"],
                   ["123", "novicexx"],
                   ["sub", "  intermediate"]]
    sample_args.each do |sample|
      expect(valid_args?(sample)).to be false 
    end
  end

  it "generates the correct usage information" do
    usage = "USAGE: flashCards <operation> <difficulty> \n\tValid operations: add | sub | mul | div\n\tValid difficulties: novice | intermediate | advanced"
    expect(usage_info).to eq(usage)
  end
end
