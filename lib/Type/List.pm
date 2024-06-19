package Type::List;

use Exporter "import";
our @EXPORT_OK = qw(list);

sub list {
	my $self = {
		head => shift,
		tail => shift
	};
	bless $self, __PACKAGE__;
	return $self;
}

sub getType {
	my ($self) = @_;
	return __PACKAGE__;
}

sub setHead {
	my ($self, $object) = @_;
	$self->{head} = $object;
	return $self->{head};
}

sub setTail {
	my ($self, $object) = @_;
	$self->{tail} = $object;
	return $self->{tail};
}

sub getHead {
	my ($self) = @_;
	return $self->{head};
}

sub getTail {
	my ($self) = @_;
	return $self->{tail};
}

1;
