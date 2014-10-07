#! perl

=pod

The sum of the squares of the first ten natural numbers is,

 1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

  (1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten
natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one
hundred natural numbers and the square of the sum.

L<https://projecteuler.net/problem=6>

=cut

use integer;
$n = 100;

$sq += $_ for 1..$n;
$sq = $sq * $sq;

$sum += ($_ * $_) for 1..$n;
print $sq - $sum; 
