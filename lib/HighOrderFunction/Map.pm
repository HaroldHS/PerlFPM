package HighOrderFunction::Map;

use Exporter "import";
our @EXPORT_OK = qw(imprMap mapping);

sub imprMap {
	my $function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	for $target (@target_list) {
		push(@result, $function->($target));
	}

	return @result;
}

sub mapping {
	my $function = $_[0];
	my $flist = $_[1];

	sub traverseFunctionalList {
		my $elem = $_[0]->getHead();
		$_[0]->setHead($function->($elem));

		if ($_[0]->getTail() eq "") {
			return;
		} else {
			traverseFunctionalList($_[0]->getTail());
		}
	}

	traverseFunctionalList($flist);
	return $flist;
}

1;
