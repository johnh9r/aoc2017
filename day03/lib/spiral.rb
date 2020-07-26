# consider worked example from challenge:
#
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11  ^
# 20   7   8   9  10  ^
# 21  22  23  24  25 26
#                   (49)
#
#  c   C   C   C   c
#  C   b   B   b   C    }
#  C   B   A   B   C    } = side (upper-case letters)
#  C   b   B  .b   C    } vs corners (lower-case letters)
#  c   C   C   C  .c
#
# ring A(0) numbers  1 square  (degenerate starting point)
# ring B(1) numbers  8 squares (= 4 x 1 side + 4 corners)
# ring C(2) numbers 16 squares (= 4 x 3 side + 4 corners)
# ring D(3) numbers 24 squares (= 4 x 5 side + 4 corners)
#
#
# bottom-right ("final") square (.X) of any ring has highest number,
# i.e. sum of all enclosed (and necessarily complete) rings plus its own number of squares:
#
#   .            .
#      .      .
#          1
#      .      1+8
#   .            1+8+16
#
#
# Manhattan distance of any square on bottom-right diagonal is 2 x ring-index (e.g. C: 2)

def calc_manhattan_distance(target_square_index)
  # handle special case of central square (and non-sensical inputs)
  return 0 if target_square_index <= 1

  ring_idx = 0
  # degenerate starting point:  -1; 1, 3, 5, ...
  num_squares_on_ring_side = -1
  num_squares_on_ring = 1
  final_square_idx = 1

  while (final_square_idx <= target_square_index) do
    ring_idx += 1
    num_squares_on_ring_side += 2
    num_squares_on_ring = 4 * num_squares_on_ring_side + 4
    final_square_idx += num_squares_on_ring
  end

  # step back one ring after overshooting target
  final_square_idx -= num_squares_on_ring
  ring_idx -= 1
  # but keep num_squares_on_ring referring to further incomplete ring (processed step-wise below)

  # final square of outer-most complete ring is on bottom-right diagonal
  # e.g. square 9 completes ring 1 and is 2 steps away from centre (up + left)
  dist = 2 * ring_idx

  num_steps_remaining = target_square_index - final_square_idx

  # bottom-right diagonal, e.g. complete ring 2: coordiante (2, -2) holds value 25
  x = ring_idx
  y = -1 * ring_idx

  # order of tests significant;  central square = (0, 0)
  while (num_steps_remaining > 0) do
    case
    when (x > 0) && (x == -1 * y)
      # move right off bottom-right diagonal to start final incomplete ring
      x += 1
      # putc '>'

    when (x > 0) && (x > y.abs)
      # rising edge (moving up)
      y += 1
      # putc '^'
    when (x > 0) && (x == y)
      # top-right corner
      x -= 1
      # putc '<'
    when (y > 0) && (x.abs < y)
      # top edge, moving leftwards
      x -= 1
      # putc '<'
    when (y > 0) && (-1 * x == y)
      # top-left corner
      y -= 1
      # putc 'v'
    when (x < 0) && (x < y)
      # left edge, moving downwards
      y -= 1
      # putc 'v'
    when (x < 0) && (x == y)
      # bottom-left corner
      x += 1
      # putc '>'
    when (y < 0) && (x < y.abs)
      # bottom edge, moving rightwards
      x += 1
      # putc '>'
    # bottom-right corner would complete ring
    end

    # moved one step in whichever direction
    num_steps_remaining -= 1
  end

  # Manhattan distance
  x.abs + y.abs
end


#
# part 2
#

def calc_spiral_memory_contents(threshold)
  mem = {[0,0] => 1}
  # having seeded central cell, start next ring
  x = 1
  y = 0
  val = -1

  while (val < threshold) do
    val = sum_adjacent_cells(mem, x, y)
    mem.store([x,y], val)

    case
    when (x > 0) && (x > y.abs)
      # rising edge (moving up)
      y += 1
      # putc '^'; puts val
    when (x > 0) && (x == y)
      # top-right corner
      x -= 1
      # putc '<'; puts val
    when (y > 0) && (x.abs < y)
      # top edge, moving leftwards
      x -= 1
      # putc '<'; puts val
    when (y > 0) && (-1 * x == y)
      # top-left corner
      y -= 1
      # putc 'v'; puts val
    when (x < 0) && (x < y)
      # left edge, moving downwards
      y -= 1
      # putc 'v'; puts val
    when (x < 0) && (x == y)
      # bottom-left corner
      x += 1
      # putc '>'; puts val
    when (y < 0) && (x < y.abs)
      # bottom edge, moving rightwards
      x += 1
      # putc '>'; puts val
    when (y < 0) && (x == -1 * y)
      # move right off bottom-right diagonal to start final incomplete ring
      x += 1
      # putc '>'; puts val
    end
  end

  val
end

def sum_adjacent_cells(mem, x, y)
  # corners (TL+TR+BL+BR)
  mem.fetch([x-1, y+1], 0) +
  mem.fetch([x+1, y+1], 0) +
  mem.fetch([x-1, y-1], 0) +
  mem.fetch([x+1, y-1], 0) +
  # horizontal sides (L, R)
  mem.fetch([x-1, y], 0) +
  mem.fetch([x+1, y], 0) +
  # vertical sides (T, B)
  mem.fetch([x, y+1], 0) +
  mem.fetch([x, y-1], 0)
end
