#! perl

=pod

Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

L<https://projecteuler.net/problem=16>

=cut

use Math::BigInt;
my $n = shift || 1000;

my $e = Math::BigInt->new($n);
my $two = Math::BigInt->new(2);
$sum += $_ for split(//, $two->bpow($e));
print $sum;
