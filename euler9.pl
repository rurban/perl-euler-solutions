#! perl

=pod

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

    a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

L<https://projecteuler.net/problem=9>

=cut

use integer;

for my $a (1 .. 1000) {
  for my $b ($a+1 .. 1000) {
    for my $c ($b+1 .. 1000) {
      if ($a*$a + $b*$b == $c*$c and $a + $b + $c == 1000) {
        print $a*$b*$c;
        exit;
      }
    }
  }
}

