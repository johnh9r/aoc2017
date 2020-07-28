require 'set'

VALID = 1
INVALID = 0

def count_valid_passphrases(input)
  all_phrases = input.strip.split("\n")

  all_counts =
    all_phrases.map do |phrase|
      _, count =
        phrase.split.reduce([Set.new, 1]) do |acc, p|
          set, valid = acc
          if set.include?(p)
            [set, 0]
          else
            [set.add(p), valid]
          end
        end

        count
      end

  all_counts.sum
end
