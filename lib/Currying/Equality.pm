package Currying::Equality;

use Exporter "import";
our @EXPORT_OK = qw(eqto grtn grto smtn smto);

sub eqto {
	return sub {
		$scalar1 = $_[0];
		return sub {
			$scalar2 = $_[0];
			return $scalar1 == $scalar2 ? 1 : 0;
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

1;
