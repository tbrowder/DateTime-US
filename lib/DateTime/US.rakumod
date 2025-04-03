unit class DateTime::US;

use Timezones::US;
use LocalTime;

use DateTime::US::Subs;

has $.timezone is required;
has $.name;
has $.utc-offset;
has $.dst-exceptions;

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
    # Use correct localtime as suffix
    my $lt2 = LocalTime.new: :year($lt.year), :month($lt.month), :day($lt.day),
                             :hour($lt.hour), :minute($lt.minute), 
                             :second($lt.second), :tz-abbrev<cst>;
    $lt2.dt
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

=finish
our &begin-dst is export = &dst-begin;
sub dst-begin(:$year! --> Date) is export {
    # nth(2) dow(7) in month 3 at 0200 local
    my $nth   = 2;
    my $dow   = 7;
    my $month = 3;
    nth-dow-in-month :$year, :$nth, :$dow, :$month;
}

our &end-dst is export = &dst-end;
sub dst-end(:$year --> Date) is export {
    # nth(1) dow(7) in month 11 at 0200 local
    my $nth   = 1;
    my $dow   = 7;
    my $month = 11;
    nth-dow-in-month :$year, :$nth, :$dow, :$month;
}

sub get-dst-dates(:$year!, :$set-id! --> Hash) is export(:get-dst-date) {
    
}

