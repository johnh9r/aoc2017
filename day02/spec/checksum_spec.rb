require_relative '../lib/checksum'

describe 'part 1' do
  example 'ex #1', input: "5 1 9 5\n7 5 3\n2 4 6 8\n", output: 18 do |ex|
    expect(calc_checksum(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  it 'calculates checksum for spreadsheet' do
    input = File.open('./spec/fixtures/input-part1.txt').read.chomp
    expect(calc_checksum(input)).to equal(44_216)
  end
end
