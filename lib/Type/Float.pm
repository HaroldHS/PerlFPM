package Type::Float;

use Exporter "import";
our @EXPORT_OK = qw(float);

sub float {
	my $self = {
		value => shift
	};

	if ($self->{value} =~ /^[+-]?(?:\d+\.?|\.\d)\d*$/) {
		bless $self, __PACKAGE__;
		return $self;
	} else {
		die "[-] Given value is not in float format\n";
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
