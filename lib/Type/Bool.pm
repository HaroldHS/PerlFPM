package Type::Bool;

use Exporter "import";
our @EXPORT_OK = qw(bool);

sub bool {
	my $self = {
		value => shift
	};

	if(($self->{value} eq "true") or ($self->{value} eq "false")) {
		bless $self, __PACKAGE__;
		return $self;
	} else {
		die "[-] Given value is not in boolean format\n";
	}
}

sub isBool {
	my ($self) = @_;
	return 1;
}

sub getValue {
	my ($self) = @_;
	return $self->{value};
}

1;
