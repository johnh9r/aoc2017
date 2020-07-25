def calc_checksum(input)
  all_rows = int_rows(input)

  min_max_rs =
    all_rows.reduce([]) do |acc_rs, row|
      min_max =
        row.reduce([2**31, 0]) do |acc, v|
          min, max = acc
          [
            (v < min) ? v : min,
            (max < v) ? v : max
          ]
        end
      acc_rs << min_max
    end

  min_max_rs.sum { |elem| elem[1] - elem[0] }
end

def int_rows(input)
  all_rows = input.split("\n")
  all_rows.map do |row|
    row.split.map(&:to_i)
  end
end
