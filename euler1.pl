#! perl

=pod

If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

L<https://projecteuler.net/problem=1>

=cut

for (3..999) {
    $sum += $_ if ($_ % 3 == 0) or ($_ % 5 == 0);
}
print $sum;
