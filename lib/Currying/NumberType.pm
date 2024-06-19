package Currying::NumberType;

use Exporter "import";
our @EXPORT_OK = qw(isOdd isEven);

sub isOdd {
	return sub {
		my $num = $_[0];
		if (defined($num & 1)) {
			return ($num & 1) == 1 ? 1 : 0;
		} elsif ($num1->getType()) {
			return ($num1->getValue() & 1) == 1 ? 1 : 0;
		} else {
			die "[-] Undefined error in Currying::NumberType::isOdd()\n";
		}
	} 
}

sub isEven {
	return sub {
		my $num = $_[0];
		if (defined($num & 1)) {
			return ($num & 1) == 0 ? 1 : 0;
		} elsif ($num1->getType()) {
			return ($num1->getValue() & 1) == 0 ? 1 : 0;
		} else {
			die "[-] Undefined error in Currying::NumberType::isEven()\n";
		}
	}
}

1;
