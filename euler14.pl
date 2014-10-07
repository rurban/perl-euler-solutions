#! perl

=pod

Longest Collatz sequence

The following iterative sequence is defined for the set of positive
integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following
sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1)
contains 10 terms. Although it has not been proved yet (Collatz
Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

L<https://projecteuler.net/problem=14>

=cut

use integer;
my $n = shift || 1_000_000;

my ($max, $max_i);
for (2 .. $n) {
  my $i = $_;
  my $cnt = 0;
  while ($i > 1) {
    $i = $i % 2 == 0 ? $i / 2 : 3*$i + 1;
    $cnt++;
  }
  if ($cnt > $max) {
    $max = $cnt;
    $max_i = $_;
  }
}
print $max_i," / ", $max;
