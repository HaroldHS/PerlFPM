package Currying::Arithmetic;

use Exporter "import";
our @EXPORT_OK = qw(addn subn muln divn);

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

1;
