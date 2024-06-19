package Currying::Arithmetic;

use FindBin qw($Bin);
use lib "$Bin/../";

use Type::Integer qw(integer);
use Type::Float qw(float);

use Exporter "import";
our @EXPORT_OK = qw(addn subn muln divn addition subtraction multiplication division);

sub addn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			return $num1 + $num2;
		}
	}
}

sub subn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			return $num1 - $num2;
		}
	}
}


sub muln {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			return $num1 * $num2;
		}
	}
}


sub divn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			return $num1 / $num2;
		}
	}
}

sub addition {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				my $result = $num1->getValue() + $num2->getValue();
				if (($num1->getType() eq "Type::Integer") and ($num2->getType() eq "Type::Integer")) {
					return integer($result);
				} elsif (($num1->getType() eq "Type::Float") and ($num2->getType() eq "Type::Float")) {
					return float($result);
				} else {
					die "[-] Undefined error in Currying::Arithmetic::addition()\n";
				}
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type in Currying::Arithmetic::addition()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::addition()\n";
			}
		}
	}
}

sub subtraction {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				my $result = $num1->getValue() - $num2->getValue();
				if (($num1->getType() eq "Type::Integer") and ($num2->getType() eq "Type::Integer")) {
					return integer($result);
				} elsif (($num1->getType() eq "Type::Float") and ($num2->getType() eq "Type::Float")) {
					return float($result);
				} else {
					die "[-] Undefined error in Currying::Arithmetic::subtraction()\n";
				}
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type in Currying::Arithmetic::subtraction()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::subtraction()\n";
			}
		}
	}
}

sub multiplication {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				my $result = $num1->getValue() * $num2->getValue();
				if (($num1->getType() eq "Type::Integer") and ($num2->getType() eq "Type::Integer")) {
					return integer($result);
				} elsif (($num1->getType() eq "Type::Float") and ($num2->getType() eq "Type::Float")) {
					return float($result);
				} else {
					die "[-] Undefined error in Currying::Arithmetic::multiplication()\n";
				}
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type in Currying::Arithmetic::multiplication()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::multiplication()\n";
			}
		}
	}
}

sub division {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				my $result = $num1->getValue() / $num2->getValue();
				if (($num1->getType() eq "Type::Integer") and ($num2->getType() eq "Type::Integer")) {
					return integer($result);
				} elsif (($num1->getType() eq "Type::Float") and ($num2->getType() eq "Type::Float")) {
					return float($result);
				} else {
					die "[-] Undefined error in Currying::Arithmetic::division()\n";
				}
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type in Currying::Arithmetic::division()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::division()\n";
			}
		}
	}
}

1;
