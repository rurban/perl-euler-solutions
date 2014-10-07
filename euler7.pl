#! perl

=pod

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
see that the 6th prime is 13.

What is the 10 001st prime number?

L<https://projecteuler.net/problem=7>

=cut

use Math::Prime::XS 'is_prime';

my ($i, $c) = (1, 0);
while ($i++) {
  $c++ if is_prime($i);
  if ($c == 10001) {
    print $i;
    exit;
  }
}

