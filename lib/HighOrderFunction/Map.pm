package HighOrderFunction::Map;

use Exporter "import";
our @EXPORT_OK = qw(mapp f_mapp);

sub mapp {
	my $function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	for $target (@target_list) {
		push(@result, $function->($target));
	}

	return @result;
}

sub f_mapp {
	my $function = $_[0];
	my $flist = $_[1];

	sub traverseFunctionalList {
		if ($_[0]->getTail() eq "") {
			$_[0]->setHead( $function->($_[0]->getHead()) );
			return;
		} else {
			$_[0]->setHead( $function->($_[0]->getHead()) );
			traverseFunctionalList($_[0]->getTail());
		}
	}

	traverseFunctionalList($flist);
}

1;
