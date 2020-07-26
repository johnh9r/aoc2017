require_relative '../lib/spiral'

describe 'part 1' do
  example 'ex #1', input: 1, output: 0 do |ex|
    expect(calc_manhattan_distance(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  example 'ex #2', input: 12, output: 3 do |ex|
    expect(calc_manhattan_distance(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  example 'ex #3', input: 23, output: 2 do |ex|
    expect(calc_manhattan_distance(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  example 'ex #4', input: 1024, output: 31 do |ex|
    expect(calc_manhattan_distance(ex.metadata[:input])).to equal(ex.metadata[:output])
  end

  it 'calculates Manhattan distance of spiral memory cell', input: 312_051, output: 430 do |ex|
    expect(calc_manhattan_distance(ex.metadata[:input])).to equal(ex.metadata[:output])
  end
end
