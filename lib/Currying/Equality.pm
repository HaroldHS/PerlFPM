package Currying::Equality;

use Exporter "import";
our @EXPORT_OK = qw(eqto grtn grto smtn smto equal greaterThan greaterTo smallerThan smallerTo);

sub eqto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			return $num1 == $num2 ? 1 : 0;
		}
	}
}

sub grtn {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			return $num1 > $num2 ? 1 : 0;
		}
	}
}

sub grto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			return $num1 >= $num2 ? 1 : 0;
		}
	}
}

sub smtn {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			return $num1 < $num2 ? 1 : 0;
		}
	}
}

sub smto {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			return $num1 <= $num2 ? 1 : 0;
		}
	}
}

sub equal {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() == $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::equal()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::equal()\n";
			}	
		}
	}
}

sub greaterThan {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() > $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::greaterThan()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::greaterThan()\n";
			}	
		}
	}
}

sub greaterTo {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() >= $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::greaterTo()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::greaterTo()\n";
			}	
		}
	}
}

sub smallerThan {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() < $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::smallerThan()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::smallerThan()\n";
			}	
		}
	}
}

sub smallerTo {
	return sub {
		$num1 = $_[0];
		return sub {
			$num2 = $_[0];
			if ($num1->getType() eq $num2->getType()) {
				return $num1->getValue() <= $num2->getValue() ? 1 : 0;
			} elsif ($num1->getType() ne $num2->getType()) {
				die "[-] Mismatch type for Currying::Equality::smallerTo()\n";
			} else {
				die "[-] Undefined error in Currying::Equality::smallerTo()\n";
			}	
		}
	}
}

1;
