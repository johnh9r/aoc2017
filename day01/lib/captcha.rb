def sum_digit_pairs(filename)
  digits = File.open(filename).read.chomp.split('').map(&:to_i)

  # duplicate first digit at very end to mimic circular nature
  digits.push(digits[0])

  sum, _ =
    digits.reduce([0, nil]) do |acc_prev_d, d|
      acc, prev_d = acc_prev_d
      if prev_d == d
        [acc + d, d]
      else
        [acc, d]
      end
    end

  sum
end
