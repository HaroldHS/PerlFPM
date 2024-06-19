package Currying::NumberType;

use Exporter "import";
our @EXPORT_OK = qw(isOdd isEven isOddInteger isEvenInteger);

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


sub isOddInteger {
	return sub {
		my $num = $_[0];
		if ($num->getType() eq "Type::Integer") {
			return ($num->getValue() & 1) == 1 ? 1 : 0;
		} else {
			die "[-] Invalid type in Currying::NumberType::isOddNumber()\n";
		}
	}
}

sub isEvenInteger {
	return sub {
		my $num = $_[0];
		if ($num->getType() eq "Type::Integer") {
			return ($num->getValue() & 1) == 0 ? 1 : 0;
		} else {
			die "[-] Invalid type in Currying::NumberType::isEvenNumber()\n";
		}
	}
}

1;
