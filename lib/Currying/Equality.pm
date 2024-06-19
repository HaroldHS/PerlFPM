package Currying::Equality;

use Exporter "import";
our @EXPORT_OK = qw(eqto grtn grto smtn smto);

sub eqto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if (defined($num1 == $num2)) {
				return $num1 == $num2 ? 1 : 0;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() == $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::eqto()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::eqto()\n";
			}
		}
	}
}

sub grtn {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if (defined($num1 > $num2)) {
				return $num1 > $num2 ? 1 : 0;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() > $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::grtn()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::grtn()\n";
			}
		}
	}
}

sub grto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if (defined($num1 >= $num2)) {
				return $num1 >= $num2 ? 1 : 0;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() >= $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::grto()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::grto()\n";
			}
		}
	}
}

sub smtn {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if (defined($num1 < $num2)) {
				return $num1 < $num2 ? 1 : 0;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() < $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::smtn()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::smtn()\n";
			}
		}
	}
}

sub smto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if (defined($num1 <= $num2)) {
				return $num1 <= $num2 ? 1 : 0;
			} elsif ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() <= $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::smto()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::smto()\n";
			}	
		}
	}
}

1;
