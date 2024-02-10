#!/usr/bin/env raku

use lib <../lib>;
use DateTime::US;

my $tz = DateTime::US.new: :timezone('cst');

my $year = 2024;
say $tz.dst-begin: :$year;
say $tz.begin-dst: :$year;
say $tz.dst-end: :$year;
say $tz.end-dst: :$year;

=finish

=begin comment
my $lt-format = sub ($self) { 
    sprintf "%04d-%02d-%02dT%02d:%02d:%02d",
        .year, .month, .day, .hour, .minute, .second
        given $self
}
=end comment

my $lt = DateTime.new: :year(2022), :3month, :1day, :formatter($lt-format);
my $utc = $tz.to-utc: :localtime($lt);
say "localtime: $lt";
say "utc:       $utc";

=finish

my $dt = DateTime.now;

DateTime::US.show;

=finish
.say for @tz;

=finish

my $tz = DateTime::US.new;

