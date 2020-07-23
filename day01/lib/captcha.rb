def sum_digit_pairs(filename)
  digits = digits(filename)

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

def sum_para_digit_pairs(filename)
  digits = digits(filename)
  num_elem = digits.length
  fail 'even number of elements expected' if num_elem % 2 != 0

  sum, _ =
    digits.each_with_index.reduce(0) do |acc, d_i|
      d, i = d_i
      opp_digit = digits[(i + num_elem / 2) % num_elem]
      if opp_digit == d
        acc + d
      else
        acc
      end
    end

  sum
end

def digits(filename)
  File.open(filename).read.chomp.split('').map(&:to_i)
end
