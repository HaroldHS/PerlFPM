package HighOrderFunction::Filter;

use Exporter "import";
our @EXPORT_OK = qw(imprFilter filtering);

sub imprFilter {
	my $conditional_function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	foreach $target (@target_list) {
		if ($conditional_function->($target) == 1) {
			push(@result, $target);
		}
	}

	return @result;
}

sub filtering {
	my $conditional_function = $_[0];
	my $flist = $_[1];

	sub traverseFunctionalList {
		# If the condition is not met, remove the object. Else, just traverse
		if ( ($conditional_function->($_[0]->getHead()) != 1) and ($_[0]->getTail() ne "") ) {
			$_[0]->setHead($_[0]->getTail()->getHead()); # take next head from current tail
			$_[0]->setTail($_[0]->getTail()->getTail()); # take next tail from current tail
		}
		# For final pair
		elsif ( ($conditional_function->($_[0]->getHead()) != 1) and ($_[0]->getTail() eq "") ) {
			$_[0]->setHead("");
			return;
		}

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
