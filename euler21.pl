#! perl

=pod

Amicable numbers

Let d(n) be defined as the sum of proper divisors of n (numbers less
than n which divide evenly into n).  If d(a) = b and d(b) = a, where a
≠ b, then a and b are an amicable pair and each of a and b are called
amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284
are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

L<https://projecteuler.net/problem=21>

=cut

use integer;
my $max = shift || 10_000;
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
  print "$n: $sum - (",join(",",@div).")\n" if DEBUG;
  $sum
}

my ($sum, %h);
for my $a (2..$max-1) {
  next if $h{$a};
  my $b = d($a);
  print "$b = d($a)\n" if DEBUG;
  if ($a != $b and $a == d($b)) {
    $h{$b}++;
    print "pair: $a $b\n";
    $sum += $a + $b;
  }
}
print $sum;
