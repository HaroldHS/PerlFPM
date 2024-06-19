package Currying::Arithmetic;

use Exporter "import";
our @EXPORT_OK = qw(addn subn muln divn);

sub addn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			# Default functionality
			if (defined($num1 + $num2)) {
				return $num1 + $num2;
			}
			# Perform type checking
			#
			# If both num1 and num2 use Type module and have same type
			elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() + $num2->getValue();
			}
			# If both num1 and num2 use Type module and have different type
			elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Arithmetic::addn()\n";
			}
			else {
				die "[-] Undefined error in Currying::Arithmetic::addn()\n";
			}
		}
	}
}

sub subn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if (defined($num1 - $num2)) {
				return $num1 - $num2;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() - $num2->getValue();
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Arithmetic::subn()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::subn()\n";
			}
		}
	}
}


sub muln {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if (defined($num1 * $num2)) {
				return $num1 * $num2;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() * $num2->getValue();
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Arithmetic::muln()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::muln()\n";
			}
		}
	}
}


sub divn {
	return sub {
		my $num1 = $_[0];
		return sub {
			my $num2 = $_[0];
			if (defined($num1 / $num2)) {
				return $num1 / $num2;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() / $num2->getValue();
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Arithmetic::divn()\n";
			} else {
				die "[-] Undefined error in Currying::Arithmetic::divn()\n";
			}
		}
	}
}

1;
