unit module DateTime::Subs;

use Date::Utils;

our &begin-dst is export = &dst-begin;
our &end-dst is export = &dst-end;

sub dst-begin(:$year --> Date) is export {
    # nth(2) dow(7) in month 3 at 0200 local
    my $nth   = 2;
    my $dow   = 7;
    my $month = 3;
    my $d = nth-dow-in-month :$year, :$nth, :$dow, :$month;
    $d
}

sub dst-end(:$year --> Date) is export {
    # nth(1) dow(7) in month 11 at 0200 local
    my $nth   = 1;
    my $dow   = 7;
    my $month = 11;
    my $d = nth-dow-in-month :$year, :$nth, :$dow, :$month;
    $d
}

sub get-dst-dates(:$year!, :$set-id! --> Hash) is export(:get-dst-date) {
    
}

