require_relative '../lib/passphrase'

describe 'part 1' do
  # second passphrase (of three) is invalid (repeated: 'aa')
  example 'ex #1', input: "aa bb cc dd ee\naa bb cc dd aa\naa bb cc dd aaa", output: 3 - 1 do |ex|
    expect(count_valid_passphrases(ex.metadata[:input])).to be(ex.metadata[:output])
  end

  it 'counts number of valid passphrases' do
    input = File.open('./spec/fixtures/input-part1.txt').read
    expect(count_valid_passphrases(input)).to equal(451)
  end
end
