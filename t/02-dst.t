use Test;

use DateTime::US;

my $timezone = 'cst';
my $tz = DateTime::US.new: :$timezone;

# test dst start and stop dates against known fed data

=begin comment

Note: This is hand generated for now.

Update the DST (daylight savings time) module with the desired year
('DST.pm').

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

=end comment

my $dt = $tz.dst-start: 2016;
is $dt.year, 2016;
is $dt.month, 3;
is $dt.day, 13;





done-testing;
