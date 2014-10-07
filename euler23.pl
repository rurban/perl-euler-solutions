#! perl

=pod

Non-abundant sums

A perfect number is a number for which the sum of its proper divisors
is exactly equal to the number. For example, the sum of the proper
divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
is a perfect number.

A number n is called deficient if the sum of its proper divisors is
less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
smallest number that can be written as the sum of two abundant numbers
is 24. By mathematical analysis, it can be shown that all integers
greater than 28123 can be written as the sum of two abundant
numbers. However, this upper limit cannot be reduced any further by
analysis even though it is known that the greatest number that cannot
be expressed as the sum of two abundant numbers is less than this
limit.

Find the sum of all the positive integers which cannot be written as
the sum of two abundant numbers.

L<https://projecteuler.net/problem=23>

=cut

use integer;
my $m = shift || 28123;
use constant DEBUG => @ARGV > 1;

sub d {
  my $n = shift;
  my ($sum, @div);
  for my $i (1 .. int($n/2)) {
    unless ($n % $i) {
      push @div, $i;
      $sum += $i;
    }
  }
  $sum
}

my ($sum, %ab, @keys, %uneven);
# is $i the sum of 2 ab nums?
sub is_sum {
  my $n = shift;
  return undef if $n < 24; # the smallest sum of ab's
  return undef if $n % 2 and $n < 945;
  #return 1 if $n > 28123;
  for my $a (@keys) {
    return if $a > $n;
    print "$n = $a + ",$n-$a,"\n" if DEBUG and $ab{$n - $a};
    return 1 if $ab{$n - $a};
    print "$n != $a\n" if DEBUG;
  }
  undef
}
for my $i (12..$m) {
  if (d($i) > $i) {
    $ab{$i} = 1;
    push @keys, $i;
    # we have a very low number of uneven ab's. check them in the sum
    #if ($i % 2) { # 945, 1575 are the first uneven numbers
  }
}
for my $i (1..$m) {
  unless (is_sum($i)) {
    $sum += $i;
    print $i,"\n" if DEBUG; 
  }
}
print $sum;
