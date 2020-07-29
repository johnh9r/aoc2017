require_relative '../lib/trampolines'

describe 'part 1' do
  example 'ex #1', input: "0\n3\n0\n1\n-3\n", output: 5 do |ex|
    expect(count_jumps_to_exit(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  it 'counts number of self-modifying jumps to address out of range' do
    input = File.open('./spec/fixtures/input-part1.txt').read
    expect(count_jumps_to_exit(input)).to equal(381_680)
  end
end
