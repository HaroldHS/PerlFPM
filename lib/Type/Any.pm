package Type::Any;

use Exporter "import";
our @EXPORT_OK = qw(any);

sub any {
	my $self = {
		value => shift
	};
	
	bless $self, __PACKAGE__;
	return $self;
}

sub getValue {
	my ($self) = @_;
	return $self->{value};
}

sub getType {
	return __PACKAGE__;
}

1;
