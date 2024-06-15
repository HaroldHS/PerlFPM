package Currying::NumberType;

use Exporter "import";
our @EXPORT_OK = qw(isOdd isEven);

sub isOdd {
	return sub {
		my $num = $_[0];
		return ($num & 1) == 1 ? 1 : 0;
	} 
}

sub isEven {
	return sub {
		my $num = $_[0];
		return ($num & 1) == 0 ? 1 : 0;
	}
}

1;
