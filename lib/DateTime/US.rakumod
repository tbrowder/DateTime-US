unit class DateTime::US;

use Timezones::US;

has $.timezone is required;
has $.name;
has $.utc-offset;
has $.dst-exceptions;

=begin comment
#| Formatter for local time
our $lt-format = sub ($self) is export {
    sprintf "%04d-%02d-%02dT%02d:%02d:%02d",
        .year, .month, .day, .hour, .minute, .second
        given $self
}
=end comment

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
