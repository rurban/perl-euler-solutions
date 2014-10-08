#! perl

=pod

Lexicographic permutations

A permutation is an ordered arrangement of objects. For example, 3124
is one possible permutation of the digits 1, 2, 3 and 4. If all of the
permutations are listed numerically or alphabetically, we call it
lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2,
3, 4, 5, 6, 7, 8 and 9?

L<https://projecteuler.net/problem=24>

=cut

use integer;
$n = shift || 1_000_000;
use constant DEBUG => @ARGV > 1;

use Math::Combinatorics;
my $c = Math::Combinatorics->new(data => [qw(0 1 2 3 4 5 6 7 8 9)]);
my $p;
for (1..$n) {
  @p = $c->next_permutation;
  print join('', @p)."\n" if DEBUG;
}
print join"",@p;

# or just:
# perl -MMath::Combinatorics -e'my $c = Math::Combinatorics->new(data=>[0..9]);for (1..1_000_000) {@p = $c->next_permutation}print join"",@p;'
