#! perl

=pod

Factorial digit sum

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

L<https://projecteuler.net/problem=20>

=cut

use Math::BigInt;
my $n = Math::BigInt->new(100);
$sum += $_ for split(//, $n->bfac);
print $sum;

# perl -MMath::BigInt -e'$n=Math::BigInt->new(100); $sum += $_ for split(//, $n->bfac);print $sum;'
