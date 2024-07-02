package HighOrderFunction::Filter;

use FindBin qw($Bin);
use lib "$Bin/../";

use Exporter "import";
our @EXPORT_OK = qw(imprFilter filtering);

use Operation::FunctionSignatureCheck qw(check);

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

#
# Function signature = ("Type::AAAAA" , "Type::BBBBB") -> input = [Type::AAAAA], output = [Type::BBBBB]
#
sub filtering {
	my @function_signature = ();
	my $is_function_signature = 0;
	my $conditional_function = $_[0];
	my $flist = $_[1];

	# Method overloading for function signature facility
	if ( (ref($_[0]) eq "ARRAY") and ( @{$_[0]}[0] =~ /^Type::[a-zA-Z]+$/ ) ) { # if the first argument is a list and the first element is "Type::XXXXXXX", it might be a function signature
		$is_function_signature = check($_[0]);

		if($is_function_signature) {
			@function_signature = @{$_[0]};
			$conditional_function = $_[1];
			$flist = $_[2];

			# NOTE: Since filter only remove some elements in functional list, so both input and output signature must be the same
			unless ($function_signature[0] eq $function_signature[1]) {
				die "[-] Invalid function signature for filtering()\n";
			}
		} else {
			die "[-] List is prohibited in functional filter()\n";
		}
	}

	sub traverseFunctionalList {
		# If the condition is not met, remove the object. Else, just traverse
		if ( ($conditional_function->($_[0]->getHead()) != 1) and ($_[0]->getTail() ne "") ) {

			# If function signature provided, then check the type. If it has an invalid type, stop the program
			if ((scalar(@function_signature) != 1) and ($_[0]->getHead()->getType() ne $function_signature[0])) {
				die "[-] Invalid type at filtering()\n";
			} else {
				$_[0]->setHead($_[0]->getTail()->getHead()); # take next head from current tail
				$_[0]->setTail($_[0]->getTail()->getTail()); # take next tail from current tail
			}
		}

		# For final pair
		elsif ( ($conditional_function->($_[0]->getHead()) != 1) and ($_[0]->getTail() eq "") ) {

			# Check function signature
			if ((scalar(@function_signature) != 1) and ($_[0]->getHead()->getType() ne $function_signature[0])) {
				die "[-] Invalid type for last element at filtering()\n";
			} else {
				$_[0]->setHead("");
				return;
			}
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
