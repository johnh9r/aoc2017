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

describe 'part 2' do
  # second and fifth passphrase (of five) are invalid (repeated: 'abcde', 'iiio')
  example 'ex #1',
    input: """
      abcde fghij
      abcde xyz ecdab
      a ab abc abd abf abj
      iiii oiii ooii oooi oooo
      oiii ioii iioi iiio
      """,
    output: 5 - 2 \
  do |ex|
    expect(count_valid_passphrases(ex.metadata[:input]) do |p|
      p.split('').sort.join
    end).to be(ex.metadata[:output])
  end

  it 'counts number of valid passphrases, respecting anagrams' do
    input = File.open('./spec/fixtures/input-part1.txt').read
    expect(count_valid_passphrases(input) do |p|
      # anagrams contain same number of same kinds of letters (canonical representation)
      p.split('').sort.join
    end).to equal(223)
  end
end
