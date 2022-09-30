unit class DateTime::US;

use Timezones::US;

has $.timezone is required;
has $.name;
has $.utc-offset;
has $.dst-exceptions;

#| Formatter for local time
our $lt-format = sub ($self) is export {
    sprintf "%04d-%02d-%02dT%02d:%02d:%02d",
        .year, .month, .day, .hour, .minute, .second
        given $self
}

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

# subroutines
sub is-dst(DateTime :$localtime --> Bool) is export {
    my $t = $localtime;
    my $year = $t.year;

    my $start-time = begin-dst $year;
    my $end-time   = end-dst $year;

    # now we can check if in or out
    if $t < $start-time {
        return False;
    }
    elsif $t > $end-time {
        return False;
    }
    else {
        return True
    }
}

sub begin-dst($year! --> DateTime) is export {
   # second Sunday in March
   # get day-of-week for yyyy-03-01
   my $day1 = Date.new: :$year, :3month, :1day;
   my $dow  = $day1.day-of-week; # 1..7 (Mon..Sun)
   my $day-skip = 7 - $dow;

   my $sunday = $day1 + $day-skip;
   my $wdom = $sunday.weekday-of-month; # 1..5
   die "FATAL: day $sunday is not the first, it's Sunday {$wdom} of March" if $wdom != 1;
   my $dst = $sunday + 7;
   my $dst-begin = DateTime.new: :date($dst), :2hour, :0minute, :0second;
}

sub end-dst($year --> DateTime) is export {
   # first Sunday in November
   # get day-of-week for yyyy-11-01
   my $day1 = Date.new: :$year, :11month, :1day;
   my $dow  = $day1.day-of-week; # 1..7 (Mon..Sun)
   my $day-skip = 7 - $dow;

   my $sunday = $day1 + $day-skip;
   my $wdom = $sunday.weekday-of-month; # 1..5
   die "FATAL: day $sunday is not the first, it's Sunday {$wdom} of November" if $wdom != 1;
   my $dst = $sunday;
   my $dst-end = DateTime.new: :date($dst), :2hour, :0minute, :0second;
}

sub show-us-data(--> Str) is export {
    say "US timezone and DST data";
    say "========================";

    say "Timezones";
    say "---------";
    for @tz -> $tz {
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ~ ' Standard Time';
        my $oset = %tzones{$tz}<utc-offset>;
        $oset = $oset > 0 ?? '+' ~ $oset !! $oset;
        my $exc  = %dst-exceptions{$tz.lc}:exists ?? 'Yes' !! 'No';
        #print qq:to/HERE/;
        say qq:to/HERE/;
        {$tz.uc} - $name
            Offset from UTC: $oset
            Exceptions to DST? $exc
        HERE
    }

    say "DST exceptions";
    say "--------------";
    for @tz -> $tz {
        next unless %dst-exceptions{$tz}:exists;
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ~ ' Standard Time';
        say $name;
        my %h = %(%dst-exceptions{$tz});
        for %h.keys.sort -> $k {
            my $name = %h{$k}<name>;
            my $dst = %h{$k}<does-dst>;
            my $exc  = $dst ?? 'Yes' !! 'No';
            say "  $name";
            say "    Does DST? $exc";
        }
    }
}
