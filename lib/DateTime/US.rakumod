unit class DateTime::US:auth<cpan:TBROWDER>;

has $.timezone is required;
has $.name;
has $.utc;
has $.dst-exceptions;

# All US timezone data are from https://timetemperature.com
constant @tz is export = <ast est cst mst pst akst hast wst chst>;
constant %tzones = [
    ast  => {
              utc  => -4,
              name => "Atlantic",
            },
    est  => {
              utc  => -5,
              name => "Eastern",
            },
    cst  => {
              utc  => -6,
              name => "Central",
            },
    mst  => {
              utc  => -7,
              name => "Mountain",
            },
    pst  => {
              utc  => -8,
              name => "Pacific",
            },
    akst => {
              utc  => -9,
              name => "Alaska",
            },
    hast => {
              utc  => -10,
              name => "Hawaii-Aleutian",
            },
    wst  => {
              utc  => -11,
              name => "Samoa",
            },
    chst => {
              utc  => +10,
              name => "Chamorro",
            },
];

constant %dst-exceptions = [
    mst  => {
              az => {
                      name => "Arizona",
                      does-dst => 0,
              }
            },
];

submethod TWEAK {
    # only certain names are recognized
    unless %tzones{$!timezone.lc}:exists {
        die qq:to/HERE/;
        FATAL: US timezone {$!timezone.uc} is not recognized.
          Execute 'DateTime::US.show' to see all US timezones.
        HERE
    }
    # set the zones' attributes
    $!name     = %tzones{$!timezone.lc}<name>;
    $!utc      = %tzones{$!timezone.lc}<utc>;
}

method show {
    say "US timezone and DST data";
    say "========================";

    say "Timezones";
    say "---------";
    for @tz -> $tz {
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ~ ' Standard Time';
        my $oset = %tzones{$tz}<utc>;
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
