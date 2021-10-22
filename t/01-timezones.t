use Test;
use IO::Capture::Simple;

use DateTime::US;

plan 30;

lives-ok {
    my $out = capture_stdout { DateTime::US.show };
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
    my $timezone = 'ast';
    my $tz;
    lives-ok {
        $tz = DateTime::US.new: :$timezone;
    }
    my $z = $timezone;
    is $tz.name, 'Atlantic', "testing attributes of $z";
    is $tz.utc, -4;
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
    is $tz.utc, -5;
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
    is $tz.utc, -6;
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
    is $tz.utc, -7;
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
    is $tz.utc, -8;
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
    is $tz.utc, -9;
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
    is $tz.utc, -10;
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
    is $tz.utc, -11;
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
    is $tz.utc, +10;
}

done-testing;
