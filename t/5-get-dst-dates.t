use Test;

use DateTime::US::Subs :ALL;
use UUID::V4;

# test DST start and stop dates against known fed data
use lib 't/data';
use DST-Data;
my %DST = %dst-data;

my $set-id = uuid-v4;
is is-uuid-v4($set-id), True, "good UUID::V4";

for 2016..2030 -> $year {
    my %dst = get-dst-dates :$year, :$set-id;

    for %dst.keys -> $date {
        for %dst{$date}.kv -> $key, $v {
            my $info = $key.split('|').join(" ").words.tail;
            my $d = Date.new: $v;

            # get the test data
            my $begin-month = %DST{$year}<begin><month>;
            my $begin-day   = %DST{$year}<begin><day>;
            my $end-month   = %DST{$year}<end><month>;
            my $end-day     = %DST{$year}<end><day>;
        
            my $bdate = Date.new: :$year, :month($begin-month), :day($begin-day);
            my $edate = Date.new: :$year, :month($end-month), :day($end-day);
       
            if $info ~~ /:i begin / {
 	        is $bdate, $d, "is $bdate, $d";
            }
            else {
 	        is $edate, $d, "is $edate, $d";
            }
        }
    }
} # end of year 2016..2030

done-testing;

