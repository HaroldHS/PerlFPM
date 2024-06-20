package Operation::ListOperation;

use FindBin qw($Bin);
use lib "$Bin/../";

use Exporter "import";
our @EXPORT_OK = qw(perlListToFunctionalList functionalListToPerlList printFunctionalList print2DFunctionalList);

use Type::Integer qw(integer);
use Type::Float qw(float);
use Type::Bool qw(bool);
use Type::Any qw(any);
use Type::List qw(list);

sub perlListToFunctionalList {
	my @list = @{ $_[0] };
	my $functionalListObject = list("", ""); # create an empty pair

	for (my $i=1; $i<=scalar @list; $i++) {
		my $obj = $list[-$i];
		# Create an object with certain type
		if ($obj =~ /^[+-]?\d+\z/) {
			$obj = integer($obj);
		} elsif ($obj =~ /^[+-]?(?:\d+\.?|\.\d)\d*$/) {
			$obj = float($obj);
		} elsif (($obj eq "true") or ($obj eq "false")) {
			$obj = bool($obj);
		} else {
			$obj = any($obj);
		}

		if ($i == 1) {
			$functionalListObject->setHead($obj);
		} else {
			$functionalListObject = list($obj, $functionalListObject);
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

sub printFunctionalList {
	my ($flist, $separator) = @_;

	sub traverseAndPrintFunctionalList {
		if ($_[0]->getTail() eq "") {
			if ($_[0]->getHead() ne "") {
				print "".$_[0]->getHead()->getValue();
			}
			return;
		} else {
			print "".$_[0]->getHead()->getValue().$separator;
			traverseAndPrintFunctionalList($_[0]->getTail());
		}
	}

	print "(";
	traverseAndPrintFunctionalList($flist);
	print ")\n";
}

sub print2DFunctionalList {
	my ($flist, $separator) = @_;

	sub traverseZipAndPrintFunctionalList {
		if ($_[0]->getTail() eq "") {
			print "(".$_[0]->getHead()->getHead()->getValue().",".$_[0]->getHead()->getTail()->getValue().")";
			return;
		} else {
			print "(".$_[0]->getHead()->getHead()->getValue().",".$_[0]->getHead()->getTail()->getValue().")".$separator;
			traverseZipAndPrintFunctionalList($_[0]->getTail());
		}
	}

	print "(";
	traverseZipAndPrintFunctionalList($flist);
	print ")\n";
}

1;
