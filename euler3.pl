#! perl

=pod

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

L<https://projecteuler.net/problem=3>

=cut

use Math::Prime::XS 'is_prime';
use integer;

#$n = 13195;
$n = 600851475143;

my $i = int(sqrt($n));
$i-- if $i % 2 == 0;
while ($i > 1) {
  if (is_prime($i) and $n % $i == 0) {
    print "$i\n";
    exit;
  }
  $i -= 2;
}
