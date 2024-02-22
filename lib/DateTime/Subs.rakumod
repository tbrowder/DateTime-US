unit module DateTime::Subs;

use Date::Utils;

our &begin-dst is export(:begin-dst) = &dst-begin;
our &end-dst is export(:end-dst) = &dst-end;

sub dst-begin(:$year is copy --> Date) is export(:dst-begin) {
    $year = Date.new(now).year if not $year.defined;

    # nth(2) dow(7) in month 3 at 0200 local
    my $nth   = 2;
    my $dow   = 7;
    my $month = 3;
    my $d = nth-dow-in-month :$year, :$nth, :$dow, :$month;
    $d
}

sub dst-end(:$year is copy --> Date) is export(:dst-end) {
    $year = Date.new(now).year if not $year.defined;

    # nth(1) dow(7) in month 11 at 0200 local
    my $nth   = 1;
    my $dow   = 7;
    my $month = 11;
    my $d = nth-dow-in-month :$year, :$nth, :$dow, :$month;
    $d
}

sub get-dst-dates-datehash(:$year!, --> Hash) is export(:get-dst-dates-datehash) {
    my $b = dst-begin :$year;
    my $e = dst-end :$year;
}

sub get-dst-dates(:$year!, :$set-id! --> Hash) is export(:get-dst-dates) {
    my $b = dst-begin :$year;
    my $e = dst-end :$year;
    my %dst;
    my $dst;
    my $key;
    my $date;
    for $b, $e {
        my $month = $_.month;
        my $day   = $_.day;
        my $id    = $month == 3 ?? "begin-DST" !! "end-DST";
        $date = Date.new: :$year, :$month, :$day;
        $key = $set-id ~ '|' ~ $id;
        %dst{$date}{$key} = $_;
    }
    %dst
}
