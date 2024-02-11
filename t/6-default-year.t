use Test;

use DateTime::Subs :ALL;

# test DST start and stop dates against known fed data
use lib 't/data';
use DST-Data;
my %DST = %dst-data;

# test default year entry
my $curr-year = Date.new(now).year;

my $b  = begin-dst :year($curr-year);
my $b2 = begin-dst;
my $e  = end-dst :year($curr-year);
my $e2 = end-dst;

is $b.year, $b2.year;
is $b.month, $b2.month;
is $b.day, $b2.day;

is $e.year, $e2.year;
is $e.month, $e2.month;
is $e.day, $e2.day;

done-testing;
