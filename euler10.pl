#! perl

=pod

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

L<https://projecteuler.net/problem=10>

=cut

use Math::Prime::XS 'is_prime';

for (2..2_000_000) {
  $sum += $_ if is_prime($_);
}
print $sum;
