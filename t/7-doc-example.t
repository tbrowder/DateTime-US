use Test;

use DateTime::US;
use LocalTime;

my $tz = DateTime::US.new: :timezone<CST>;
my $sunriseZ = DateTime.new: "2024-02-21T12:23:00Z";
say $sunriseZ; # 2024-02-21T12:23:00Z
my $localtime = $tz.to-localtime :utc($sunriseZ);
say $localtime; # 2024-02-21T06:23:00 CST

is $localtime.year, 2024;
is $localtime.month, 2;
is $localtime.day, 21;
is $localtime.hour, 6;
is $localtime.minute, 23;
is $localtime.second, 0;

done-testing;

