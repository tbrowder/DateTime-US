use Test;
use DateTime::US;

plan 30;

lives-ok {
    DateTime::US.show;
}

dies-ok {
    my $tz = DateTime::US.new;
}

dies-ok {
    my $tz = DateTime::US.new: :timezone('us');
}

# All US timezone data are from https://timetemperature.com
my %tz = set <ast est cst mst pst akst hast wst chst az>;
for @tz -> $timezone {
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }

    # test all attributes
    my $z = $timezone;
    when $z eq 'ast' {
        is $tz.name, 'Atlantic', "testing attributes of $z";
        is $tz.utc, -4;
    }
    when $z eq 'est' {
        is $tz.name, 'Eastern', "testing attributes of $z";
        is $tz.utc, -5;
    }
    when $z eq 'cst' {
        is $tz.name, 'Central', "testing attributes of $z";
        is $tz.utc, -6;
    }
    when $z eq 'mst' {
        is $tz.name, 'Mountain', "testing attributes of $z";
        is $tz.utc, -7;
    }
    when $z eq 'pst' {
        is $tz.name, 'Pacific', "testing attributes of $z";
        is $tz.utc, -8;
    }
    when $z eq 'akst' {
        is $tz.name, 'Alaska', "testing attributes of $z";
        is $tz.utc, -9;
    }
    when $z eq 'hast' {
        is $tz.name, 'Hawaii-Aleutian', "testing attributes of $z";
        is $tz.utc, -10;
    }
    when $z eq 'wst' {
        is $tz.name, 'Samoa', "testing attributes of $z";
        is $tz.utc, -11;
    }
    when $z eq 'chst' {
        is $tz.name, 'Chamorro', "testing attributes of $z";
        is $tz.utc, +10;
    }
}


done-testing;
