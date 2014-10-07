#! perl

=pod

Number letter counts

If the numbers 1 to 5 are written out in words: one, two, three, four,
five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were
written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred
and forty-two) contains 23 letters and 115 (one hundred and fifteen)
contains 20 letters. The use of "and" when writing out numbers is in
compliance with British usage.

L<https://projecteuler.net/problem=17>

=cut

# INCORRECT
use integer;
my $n = 1000;

my %words = (
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",

  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",

  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",

  100 => "hundred",
  1000 => "thousand"
);

sub word {
  my $i = int(shift);
  my $s = "";
  my $ori = $i;
  if ($i >= 1000) {
    # one thousand
    $s = $words{int($i / 1000)} . " " . $words{1000};
    $i = $i % 1000;
  }
  if ($i >= 100) {
    # and five hundred
    $s .= " and ". $words{int($i / 100)} . " " . $words{100};
    $i = $i % 100;
  }
  if ($i > 15) {
    if ($i < 20) {
      # and fourteen
      $s .= " and " . $words{$i % 10} . "teen";
    } else {
      # and seventy-seven
      $s .= " and " . $words{10*int($i / 10)} . "-" . $words{$i % 10};
    }
    $i = $i - int($i / 10);
  }
  elsif ($i) {
    $s .= " and " . $words{$i};
  }
  $s =~ s/^ and //; $s =~ s/-$//;
  print "$ori: $s\n";
  $s =~ s/[ -]//g;
  length $s;
}

my $c = 0;
$c += word($_) for (1 .. $n);
print $c;
# but incorrect: 21144, 21134
