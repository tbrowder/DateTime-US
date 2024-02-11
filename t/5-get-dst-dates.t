use Test;

use DateTime::Subs :ALL;
use UUID::V4;

my $set-id = uuid-v4;
is is-uuid-v4($set-id), True, "good UUID::V4";

my %DST; # test data defined in the BEGIN block

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

BEGIN {
%DST = %(
    '2016' => {
                begin => {
                          day   => '13',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '6',
                          month => 11, # 'nov',
                         },
                },
     '2017' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },
     '2018' => {
                begin => {
                          day   => '11',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '4',
                          month => 11, # 'nov',
                         },
                },
     '2019' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },
     '2020' => {
                begin => {
                          day   => '8',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '1',
                          month => 11, # 'nov',
                         },
                },
     '2021' => {
                begin => {
                          day   => '14',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '7',
                          month => 11, # 'nov',
                         },
                },
     '2022' => {
                begin => {
                          day   => '13',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '6',
                          month => 11, # 'nov',
                         },
                },
     '2023' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },
     '2024' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },
     '2025' => {
                begin => {
                          day   => '9',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '2',
                          month => 11, # 'nov',
                         },
                },
     '2026' => {
                begin => {
                          day   => '8',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '1',
                          month => 11, # 'nov',
                         },
                },
     '2027' => {
                begin => {
                          day   => '14',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '7',
                          month => 11, # 'nov',
                         },
                },
     '2028' => {
                begin => {
                          day   => '12',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '5',
                          month => 11, # 'nov',
                         },
                },
     '2029' => {
                begin => {
                          day   => '11',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '4',
                          month => 11, # 'nov',
                         },
                },
     '2030' => {
                begin => {
                          day   => '10',
                          month => 3, # 'mar',
                         },
                end =>   {
                          day   => '3',
                          month => 11, # 'nov',
                         },
                },
); # end of %DST
}
