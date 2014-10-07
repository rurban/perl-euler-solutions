#! perl

=pod

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all
of the numbers from 1 to 20?

L<https://projecteuler.net/problem=5>

=cut

use integer;
my $i = 1;

LOOP:
while ($i++) {
    for (2 .. 20) {
      next LOOP if $i % $_;
    }
    print $i;
    exit;
}
