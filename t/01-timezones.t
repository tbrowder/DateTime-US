use Test;
use IO::Capture::Simple;

use DateTime::US;

plan 33;

lives-ok {
    my $out = capture_stdout { show-us-data };
}

dies-ok {
    my $tz = DateTime::US.new;
}

dies-ok {
    my $tz = DateTime::US.new: :timezone('us');
}

# All US timezone data are from https://timetemperature.com
# 1
{
    my $timezone  = 'ast';
    my $timezone2 = 'adt';
    my $tz;
    my $tz2;
    lives-ok {
        $tz  = DateTime::US.new: :$timezone;
    }
    lives-ok {
        $tz2 = DateTime::US.new: :timezone($timezone2);
    }
    my $z  = $timezone;
    my $z2 = $timezone2;
    is $tz.name, 'Atlantic', "testing attributes of $z";
    is $tz.utc-offset, -4;

    is $tz2.name, 'Atlantic', "testing attributes of $z2";
    is $tz2.utc-offset, -4;
}

# 2
{
    my $timezone = 'est';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Eastern', "testing attributes of $z";
    is $tz.utc-offset, -5;
}

# 3
{
    my $timezone = 'cst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Central', "testing attributes of $z";
    is $tz.utc-offset, -6;
}

# 4
{
    my $timezone = 'mst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Mountain', "testing attributes of $z";
    is $tz.utc-offset, -7;
}

# 5
{
    my $timezone = 'pst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Pacific', "testing attributes of $z";
    is $tz.utc-offset, -8;
}

# 6
{
    my $timezone = 'akst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Alaska', "testing attributes of $z";
    is $tz.utc-offset, -9;
}

# 7
{
    my $timezone = 'hast';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Hawaii-Aleutian', "testing attributes of $z";
    is $tz.utc-offset, -10;
}

# 8
{
    my $timezone = 'wst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Samoa', "testing attributes of $z";
    is $tz.utc-offset, -11;
}

# 9
{
    my $timezone = 'chst';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Chamorro', "testing attributes of $z";
    is $tz.utc-offset, +10;
}

