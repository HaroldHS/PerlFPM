package HighOrderFunction::Map;

use FindBin qw($Bin);
use lib "$Bin/../";

use Exporter "import";
our @EXPORT_OK = qw(imprMap mapping);

use Operation::FunctionSignatureCheck qw(check);

sub imprMap {
	my $function = $_[0];
	my @target_list = @{$_[1]};
	my @result = ();

	for $target (@target_list) {
		push(@result, $function->($target));
	}

	return @result;
}

#
# Function signature = ("Type::AAAAA" , "Type::BBBBB") -> input = [Type::AAAAA], output = [Type::BBBBB]
#
sub mapping {
	my @function_signature = ();
	my $is_function_signature = 0;
	my $function = $_[0];
	my $flist = $_[1];

	# Method overloading for function signature facility
	if ( (ref($_[0]) eq "ARRAY") and ( @{$_[0]}[0] =~ /^Type::[a-zA-Z]+$/ ) ) { # if the first argument is a list and the first element is "Type::XXXXXXX", it might be a function signature
		$is_function_signature = check($_[0]);

		if($is_function_signature) {
			@function_signature = @{$_[0]};
			$function = $_[1];
			$flist = $_[2];
		} else {
			die "[-] List is prohibited in functional mapping()\n";
		}
	}

	sub traverseFunctionalList {
		my $elem = $_[0]->getHead();

		# Check function signature (input)
		if ((scalar(@function_signature) != 1) and ($elem->getType() ne $function_signature[0])) {
			die "[-] Invalid type for input at mapping()\n";
		} else {
			$result = $function->($elem);

			# Check function signature (output)
			if (($is_function_signature == 1) and (scalar(@function_signature) > 1) and ($result->getType() ne $function_signature[1])) {
				die "[-] Invalid type for output at mapping()\n";
			}
			
			$_[0]->setHead($result);

			# If tail is "" or head of the next tail is "", it means the program should stop (end of functional list)
			if (($_[0]->getTail() eq "") or ($_[0]->getTail()->getHead() eq "")) {
				return;
			} else {
				traverseFunctionalList($_[0]->getTail());
			}
		}
	}

	traverseFunctionalList($flist);
	return $flist;
}

1;
