#! perl

=pod

A palindromic number reads the same both ways. The largest palindrome
made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit
numbers.

L<https://projecteuler.net/problem=4>

=cut

use integer;
$max = 999;

sub is_palindrome {
  my $s = "$_[0]";
  my $l = length $s;
  my $h = int($l / 2);
  return (substr($s, 0, $h) eq reverse(substr($s, $l - $h))) ? 1 : 0;
}

# very inefficient, but still brute-forcable with 1.000.000 tries (990 * 990)
for my $x (10 .. $max) {
  for my $y (10 .. $max) {
    my $prod = $x * $y;
    $largest = $prod if $prod > $largest and is_palindrome($prod);
  }
}
print $largest;
