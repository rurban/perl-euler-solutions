#! perl

=pod

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

L<https://projecteuler.net/problem=3>

=cut

use Math::Prime::XS 'is_prime';

#$n = 13195;
$n = 600851475143;

my $_ = int(sqrt($n));
$_-- if $_ % 2 == 0;
while ($_ > 1) {
  if (is_prime($_) and $n % $_ == 0) {
    print "$_\n";
    exit;
  }
  $_ -= 2;
}
