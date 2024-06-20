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

sub getValue {
	my ($self) = @_;
	return $self->{value};
}

sub getType {
	my ($self) = @_;
	return __PACKAGE__;
}

1;
