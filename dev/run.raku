#!/usr/bin/env raku

use lib <../lib>;
use DateTime::US;

my $dt = DateTime.now;

DateTime::US.show;

=finish
.say for @tz;

=finish

my $tz = DateTime::US.new;

