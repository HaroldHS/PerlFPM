package HighOrderFunction::Zip;

use FindBin qw($Bin);
use lib "$Bin/../";

use Exporter "import";
our @EXPORT_OK = qw(imprZip imprZipList zipping zippingWithFunction);

use HighOrderFunction::Map qw(imprMap mapping);
use Operation::FunctionSignatureCheck qw(check);
use Type::List qw(list);

# NOTE: DO NOT MODIFY. These subroutines are intended for imprZipList and zippingWithFunction. #
sub apply {
	return sub {
		my $function = $_[0];

		return sub {
			my $pair = $_[0];
			return $function->(@$pair[0])->(@$pair[1]);
		}
	}
}

sub functional_apply {
	return sub {
		my $function = $_[0];

		return sub {
			my $fpair = $_[0];
			return $function->($fpair->getHead())->($fpair->getTail());
		}
	}
}
############################################################################

sub imprZip {
	my @list1 = @{$_[0]};
	my @list2 = @{$_[1]};

	my @result = ();
	my $index = 0;
	my $run_flag = 1;

	while ($run_flag) {
		if ($list1[$index] and $list2[$index]) {
			push(@result, [$list1[$index], $list2[$index]]);
			$index = $index + 1;
		} else {
			$run_flag = 0;
		}
	}	

	return @result;
}

sub imprZipList {
	my $function = $_[0];
	my @list1 = @{$_[1]};
	my @list2 = @{$_[2]};
	
	my @zipp_result = imprZip(\@list1, \@list2);
	return imprMap(apply->($function), \@zipp_result);
}

#
# Function signature = ("Type::AAAAA" , "Type::BBBBB", "Type::CCCCC") -> input 1 = [Type::AAAAA], input 2 = [Type::BBBBB], output = [Type::CCCCC]
#
sub zipping {
	my @function_signature = ();
	my $is_function_signature = 0;
	my $flist1 = $_[0];
	my $flist2 = $_[1];
	my $result = list("", "");

	# Method overloading for function signature facility
	if ( (ref($_[0]) eq "ARRAY") and ( @{$_[0]}[0] =~ /^Type::[a-zA-Z]+$/ ) ) { # if the first argument is a list and the first element is "Type::XXXXXXX", it might be a function signature
		$is_function_signature = check($_[0]);

		if($is_function_signature) {
			@function_signature = @{$_[0]};
			$flist1 = $_[1];
			$flist2 = $_[2];
		} else {
			die "[-] List is prohibited in functional mapping()\n";
		}
	}

	sub traverseAndMakePairFromFunctionalLists {
		if (($_[1]->getTail() eq "") or ($_[2]->getTail() eq "")) {

			if (($is_function_signature) and (scalar(@function_signature) > 1) and ($_[1]->getHead()->getType() ne $function_signature[0])) {
				die "[-] Invalid type for first list at zipping()\n";
			}
			if (($is_function_signature) and (scalar(@function_signature) > 1) and ($_[2]->getHead()->getType() ne $function_signature[1])) {
				die "[-] Invalid type for second list at zipping()\n";
			}

			$_[0]->setHead( list($_[1]->getHead(), $_[2]->getHead()) );
			$_[0]->setTail("");
			return;
		} else {

			if (($is_function_signature) and (scalar(@function_signature) > 1) and ($_[1]->getHead()->getType() ne $function_signature[0])) {
				die "[-] Invalid type for first list at zipping()\n";
			}
			if (($is_function_signature) and (scalar(@function_signature) > 1) and ($_[2]->getHead()->getType() ne $function_signature[1])) {
				die "[-] Invalid type for second list at zipping()\n";
			}

			# Create a list contains 2 elements (a pair) and set them up
			$next_list = list("", "");
			$_[0]->setHead( list($_[1]->getHead(), $_[2]->getHead()) );
			$_[0]->setTail($next_list);
			traverseAndMakePairFromFunctionalLists($_[0]->getTail(), $_[1]->getTail(), $_[2]->getTail());
		}
	}

	traverseAndMakePairFromFunctionalLists($result, $flist1, $flist2);
	return $result;
}

sub zippingWithFunction {
	my ($function, $flist1, $flist2) = @_;
	my $zippingResult = zipping($flist1, $flist2);
	my $finalResult = mapping(functional_apply->($function), $zippingResult);
	return $finalResult;
}

1;
