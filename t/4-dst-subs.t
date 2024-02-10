use Test;

use DateTime::Subs;

# test dst start and stop dates against known fed data
my %dst;

=begin comment

Update the DST (daylight savings time) module with the desired year
('DST.pm').

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

=end comment

my $ntests = %dst.elems * 8;
plan $ntests;

for %dst.keys -> $year {
    # get the known data
    my $begin-month = %dst{$year}<begin><month>;
    my $begin-day   = %dst{$year}<begin><day>;
    my $end-month   = %dst{$year}<end><month>;
    my $end-day     = %dst{$year}<end><day>;

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

=begin comment

Note: This is hand generated for now.

Update the DST (daylight savings time) module with the desired year
('DST.pm').

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

=end comment

BEGIN {

%dst = [

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
]; # end of %dst

}
