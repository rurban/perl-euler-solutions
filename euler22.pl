#! perl

=pod

Names scores

Using F<names.txt>, a 46K text file containing over five-thousand
first names, begin by sorting it into alphabetical order. Then working
out the alphabetical value for each name, multiply this value by its
alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN,
which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

L<https://projecteuler.net/problem=22>

=cut

use List::Util 'reduce';
use constant DEBUG => @ARGV;

open my $F, "p022_names.txt" or die $!;
undef $/;
my @n = split ",", <$F>;
close $F;

my $sum;
my @s = sort map {substr($_,1,-1)} @n;
for my $i (0..$#n) {
  my $s = reduce { $a + $b } map { ord($_)-64 } split //,$s[$i];
  print $i+1,": $s[$i] $s => ",$s * ($i+1),"\n" if DEBUG;
  $sum += $s * ($i+1);
}
print $sum;
