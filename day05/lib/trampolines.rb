def count_jumps_to_exit(input)
  all_values = values(input)

  idx = 0
  count = 0

  while ((0 <= idx) && (idx < all_values.length)) do
    offset = all_values[idx]
    all_values[idx] += 1
    idx += offset
    count += 1
  end

  count
end

def values(input)
  input.strip.split("\n").map(&:to_i)
end
