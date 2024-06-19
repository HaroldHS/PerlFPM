package Operation::ListOperation;

use FindBin qw($Bin);
use lib "$Bin/../";

use Exporter "import";
our @EXPORT_OK = qw(perlListToFunctionalList functionalListToPerlList);

use Type::List qw(list);

sub perlListToFunctionalList {
	my @list = @{ $_[0] };
	my $functionalListObject = list("", ""); # create an empty pair

	for (my $i=1; $i<=scalar @list; $i++) {
		if ($i == 1) {
			$functionalListObject->setHead($list[-$i]);
		} else {
			$functionalListObject = list($list[-$i], $functionalListObject);
		}
	}
	
	return $functionalListObject;
}

sub functionalListToPerlList {
	my $flist = $_[0];
	my @result = ();

	sub traverseFunctionalList {
		if ($_[0]->getTail() eq "") {
			push(@result, $_[0]->getHead());
			return;
		} else {
			push(@result, $_[0]->getHead());
			traverseFunctionalList($_[0]->getTail());
		}
	}

	traverseFunctionalList($flist);
	return @result;
}

1;
