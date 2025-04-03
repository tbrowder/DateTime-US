use Test;

use DateTime::US::Subs :ALL;

# test DST start and stop dates against known fed data
use lib 't/data';
use DST-Data;
my %DST = %dst-data;

# test DST start and stop dates against known fed data
# but use "perpetual" data

my $ntests = %DST.elems * 8;
plan $ntests;

for %DST.keys -> $year {
    # get the known data
    my $begin-month = %DST{$year}<begin><month>;
    my $begin-day   = %DST{$year}<begin><day>;
    my $end-month   = %DST{$year}<end><month>;
    my $end-day     = %DST{$year}<end><day>;

    my $dtb  = begin-dst :$year;
    my $dtb2 = dst-begin :$year;

    my $dte  = end-dst   :$year;
    my $dte2 = dst-end   :$year;

    # 4 tests
    is $dtb.month, $begin-month;
    is $dtb.day,   $begin-day;
    is $dte.month, $end-month;
    is $dte.day,   $end-day;

    # and 4 more = 8
    is $dtb2.month, $begin-month;
    is $dtb2.day,   $begin-day;
    is $dte2.month, $end-month;
    is $dte2.day,   $end-day;
}
