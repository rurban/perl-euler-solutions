#! perl

=pod

Maximum path sum II

By starting at the top of the triangle below and moving to adjacent
numbers on the row below, the maximum total from top to bottom is 23.

   3
  7 4
 2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt, a 15K text
file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not
possible to try every route to solve this problem, as there are 299
altogether! If you could check one trillion (1012) routes every second
it would take over twenty billion years to check them all. There is an
efficient algorithm to solve it. ;o)

L<https://projecteuler.net/problem=67>

=cut

use integer;
use constant DEBUG => @ARGV;

my @t;
open my $T, "p067_triangle.txt" or die $!;
while (<$T>) {
  chomp;
  push @t, [split/ /,$_];
}
close $T;
my $rows = scalar @t;

# start at the bottom-1 and store the sums in the row we visit.
my $r = $rows - 2;
while ($r >= 0) {
  my @row =  @{$t[$r]};
  for my $i (0 .. $#row) {
    my $left = $t[$r+1]->[$i];
    my $right = $t[$r+1]->[$i+1];
    $t[$r]->[$i] += $left > $right ? $left : $right;
  }
  print "$r: ",join(",",@row),"\n  ",join(",",@{$t[$r]}),"\n" if DEBUG;
  $r--;
}
print $t[0]->[0];
