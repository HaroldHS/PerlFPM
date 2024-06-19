package Type::List;

use Exporter "import";
our @EXPORT_OK = qw(list);

sub list {
	my $self = {
		value => shift
	};

	if (@{ $self->{value} }) {
		bless $self, __PACKAGE__;
		return $self;
	} else {
		die "[-] Given reference is not a list reference\n";
	}
}

sub isList {
	my ($self) = @_;
	return 1;
}

sub getValue {
	my ($self) = @_;
	return @{$self->{value}};
}

sub getType {
	return __PACKAGE__;
}

1;
