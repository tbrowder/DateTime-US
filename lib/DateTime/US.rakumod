unit class DateTime::US:auth<cpan:TBROWDER>;

has $.timezone is required;
has $.name;
has $.utc;
has $.does-dst;

# All US timezone data are from https://timetemperature.com
constant @tz is export = <ast est cst mst pst akst hast wst chst az>;
constant %tzones = [
   ast => { utc => -4,
            name => "Atlantic",
            does-dst => 1,
          },
   est  => { utc => -5,
            name => "Eastern",
            does-dst => 1,
          },
   cst => { utc => -6,
            name => "Central",
            does-dst => 1,
          },
   mst => { utc => -7,
            name => "Mountain",
            does-dst => 1,
          },
   pst => { utc => -8,
            name => "Pacific",
            does-dst => 1,
          },
   akst => { utc => -9,
            name => "Alaska",
            does-dst => 1,
          },
   hast => { utc => -10,
            name => "Hawaii-Aleutian",
            does-dst => 1,
          },
   wst => { utc => -11,
            name => "Samoa",
            does-dst => 1,
          },
   chst => { utc => +10,
            name => "Chamorro",
            does-dst => 1,
          },

   az => { utc => -7,
            name => "Arizona",
            does-dst => 0,
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
    # set the zones attributes
    $!name     = %tzones{$!timezone.lc}<name>;
    $!utc      = %tzones{$!timezone.lc}<utc>;
    $!does-dst = %tzones{$!timezone.lc}<does-dst>;
}

method is-dst(DateTime $dt) {
}

method show {
    say "US timezones:";
    for @tz -> $tz {
        my $ans  = %tzones{$tz}<does-dst> ?? 'Yes' !! 'No';
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ne 'az' ?? $nam ~ ' Standard Time' !! 'State of ' ~ $nam;
        my $oset = %tzones{$tz}<utc>;
        $oset = $oset > 0 ?? '+' ~ $oset !! $oset;
        #print qq:to/HERE/;
        say qq:to/HERE/;
        {$tz.uc} - $name
            Offset from UTC: $oset
            Recognizes DST? $ans
        HERE
    }
}



