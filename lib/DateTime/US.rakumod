unit class DateTime::US;

use Timezones::US;
use Date::Utils;

has $.timezone is required;
has $.name;
has $.utc-offset;
has $.dst-exceptions;

=begin comment
#| Formatter for local time
our $lt-format = sub ($self) is export {
    sprintf "%04d-%02d-%02dT%02d:%02d:%02d",
        .year, .month, .day, .hour, .minute, .second
        given $self
}
=end comment

submethod TWEAK {
    # only certain names are recognized
    # also translate 'Xdt' to 'Xst'
    $!timezone ~~ s/:i dt$/st/;
    unless %tzones{$!timezone.lc}:exists {
        die qq:to/HERE/;
        FATAL: US timezone {$!timezone.uc} is not recognized.
          Execute 'DateTime::US.show' to see all US timezones.
        HERE
    }
    # set the zones' attributes
    $!name       = %tzones{$!timezone.lc}<name>;
    $!utc-offset = %tzones{$!timezone.lc}<utc-offset>;
}

multi method to-localtime(DateTime :$utc! --> DateTime) {
    # localtime = utc + utc-offset
    my $utc-offset = $!utc-offset;
    my $lt = $utc + Duration.new($utc-offset * SEC-PER-HOUR);
    if is-dst :localtime($lt) {
        $utc-offset += 1; # make time 1 hour later
        $lt = $utc + Duration.new($utc-offset * SEC-PER-HOUR);
    }
    $lt
}

multi method to-utc(DateTime :$localtime! --> DateTime) {
    # utc = localtime - utc-offset
    my $utc-offset = $!utc-offset;
    my $ut = $localtime - Duration.new($utc-offset * SEC-PER-HOUR);
    if is-dst :$localtime {
        $utc-offset += 1; # make time 1 hour later
        $ut = $localtime - Duration.new($utc-offset * SEC-PER-HOUR);
    }
    $ut
}

=begin comment

Update the DST (daylight savings time) module with the desired year

  See: https://en.wikipedia.org/wiki/Uniform_Time_Act
            effective as of 2007:

           begins: 0200 local, second Sunday in March
           ends:   0200 local, first Sunday in November

    # get the known data
    my $begin-month = %dst{$year}<begin><month>;
    my $begin-day   = %dst{$year}<begin><day>;
    my $end-month   = %dst{$year}<end><month>;
    my $end-day     = %dst{$year}<end><day>;

=end comment

method begin-dst(:$year! --> Date) {
    self.dst-begin :$year
}
method dst-begin(:$year! --> Date) {
    # nth(2) dow(7) in month 3 at 0200 local
    my $nth   = 2;
    my $dow   = 7;
    my $month = 3;
    nth-dow-in-month :$year, :$nth, :$dow, :$month;
}

method end-dst(:$year! --> Date) {
    self.dst-end :$year
}
method dst-end(:$year --> Date) {
    # nth(1) dow(7) in month 11 at 0200 local
    my $nth   = 1;
    my $dow   = 7;
    my $month = 11;
    nth-dow-in-month :$year, :$nth, :$dow, :$month;
}

