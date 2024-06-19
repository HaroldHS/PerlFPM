package Type::Integer;

use Exporter "import";
our @EXPORT_OK = qw(integer);

sub integer {
	my $self = {
		value => shift
	};

	if ($self->{value} =~ /^[+-]?\d+\z/) {
		bless $self, __PACKAGE__;
		return $self;
	} else {
		die "[-] Given value is not in integer format\n";
	}
}

sub isInteger {
	my ($self) = @_;
	return 1;
}

sub getValue {
	my ($self) = @_;
	return $self->{value};
}

sub getType {
	return __PACKAGE__;
}

1;
