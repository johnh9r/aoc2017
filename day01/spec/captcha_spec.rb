require_relative '../lib/captcha'

require 'tempfile'

describe 'captcha' do
  # NOTE playing fast and loose by leaking file descriptors
  def tmp_file(content)
    f = Tempfile.new
    f.write(content.to_s)
    f.flush
    f
  end

  describe 'part 1' do
    example 'ex #1', input: 1122, output: 3 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #2', input: 1111, output: 4 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #3', input: 1234, output: 0 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #4', input: 91212129, output: 9 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    it 'sums identical successive digits in circular input' do
      expect(sum_digit_pairs('./spec/fixtures/input-part1.txt')).to equal(1182)
    end
  end

  describe 'part 2' do
    example 'ex #1', input: 1212, output: 6 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_para_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #2', input: 1221, output: 0 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_para_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #3', input: 123425, output: 4 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_para_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #4', input: 123123, output: 12 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_para_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    example 'ex #5', input: 12131515, output: 4 do |ex|
      f = tmp_file(ex.metadata[:input])
      expect(sum_para_digit_pairs(f.path)).to equal(ex.metadata[:output])
    end

    it 'sums identical digits in opposing position in circular input' do
      expect(sum_para_digit_pairs('./spec/fixtures/input-part1.txt')).to equal(1152)
    end
  end
end
