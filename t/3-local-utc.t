use Test;

use DateTime::US;
use Timezones::US;

# test DST start and stop dates against known fed data
use lib 't/data';
use DST-Data;
my %DST = %dst-data;

plan 13;

# test conversion between local time and UTC

my $t = DateTime::US.new: :timezone('cst');
is $t.utc-offset, -6;

my $lt1 = DateTime.new: :year(2000), :month(1),  :day(25), :3hour;  # no dst
my $lt2 = DateTime.new: :year(2000), :month(3),  :day(25), :3hour;  # dst
my $lt3 = DateTime.new: :year(2000), :month(11), :day(25), :3hour;  # no dst

nok is-dst :localtime($lt1);
ok  is-dst :localtime($lt2);
nok is-dst :localtime($lt3);

my $ut1 = $t.to-utc: :localtime($lt1);
my $ut2 = $t.to-utc: :localtime($lt2);
my $ut3 = $t.to-utc: :localtime($lt3);

is $ut1.hour, 9;
is $ut2.hour, 8;
is $ut3.hour, 9;


# and the reverse
my $ut4 = DateTime.new: :year(2000), :month(1),  :day(25), :10hour;  # no dst
my $ut5 = DateTime.new: :year(2000), :month(3),  :day(25), :10hour;  # dst
my $ut6 = DateTime.new: :year(2000), :month(11), :day(25), :10hour;  # no dst

my $lt4 = $t.to-localtime: :utc($ut4);
my $lt5 = $t.to-localtime: :utc($ut5);
my $lt6 = $t.to-localtime: :utc($ut6);

nok is-dst :localtime($lt4);
ok  is-dst :localtime($lt5);
nok is-dst :localtime($lt6);

is $lt4.hour, 4;
is $lt5.hour, 5;
is $lt6.hour, 4;

