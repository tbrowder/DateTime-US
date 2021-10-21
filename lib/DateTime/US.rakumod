unit class DateTime::US:auth<cpan:TBROWDER>;

has $.tzname is required;

constant @tz = <ast est cst mst pst akst hast wst chst az>;
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
            name => "Alaskan",
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
   chst => { utc => +1,
            name => "Chamarrow",
            does-dst => 1,
          },

   az => { utc => -7,
            name => "Arizona",
            does-dst => 0,
          },
];

submethod TWEAK {
    # only certain names are recognized
    unless %tzones{$!tzname.lc}:exists {
        die "FATAL: US timezone $!tzname.uc is not recognized.";
    }
}

method is-dst(DateTime $dt) {
}

method show {
    say "US timezones:";
    for @tz -> $tz {
        my $ans  = %tzones{$tz}<does-dst> ?? 'Yes' !! 'No';
        my $nam  = %tzones{$tz}<name>;
        my $name = $nam ne 'az' ?? $nam ~ ' Standard Time' !! 'State of ' ~ $nam;

        print qq:to/HERE/;
        {$tz.uc} - {%tzones{$tz}<name>} Standard Time
            Offset from UTC: {%tzones{$tz}<utc>}
            Recognizes DST? $ans
        HERE
    }
}



