use Test;

use Timezones::US;

use DateTime::US;

# test DST start and stop dates against known fed data
use lib 't/data';
use DST-Data;
my %DST = %dst-data;

my $ntests = %DST.elems * 4;
plan $ntests;

for %DST.keys -> $year {
    # get the known data
    my $begin-month = %DST{$year}<begin><month>;
    my $begin-day   = %DST{$year}<begin><day>;
    my $end-month   = %DST{$year}<end><month>;
    my $end-day     = %DST{$year}<end><day>;

    my $dtb = begin-dst $year;
    my $dte = end-dst   $year;

    # 4 tests
    is $dtb.month, $begin-month;
    is $dtb.day,   $begin-day;
    is $dte.month, $end-month;
    is $dte.day,   $end-day;
}
