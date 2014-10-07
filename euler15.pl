#! perl

=pod

Lattice paths

Starting in the top left corner of a 2×2 grid, and only being able to
move to the right and down, there are exactly 6 routes to the bottom
right corner.

How many such routes are there through a 20×20 grid?

L<https://projecteuler.net/problem=15>

=cut

# n-by-n grid => all combinations of n downs and n rights 
# => 2n!/((n!)(2n-n)!)) = 2n!/(n!)^2

# INCORRECT
use integer;
my $n = shift || 20;

sub f {
  return 1 unless $_[0];
  return $_[0] * f($_[0] - 1);
}

print f(2*$n)/(f($n)**2);
