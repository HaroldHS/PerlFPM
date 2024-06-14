package Applicative::Application;

use Exporter "import";
our @EXPORT_OK = qw(seqApplicationList);

sub seqApplicationList {
	my @curry_functions = @{$_[0]};
	my @list = @{$_[1]};
	my @applied_function_list = ();

	foreach $curry_function (@curry_functions) {
		foreach $l (@list) {
			push(@applied_function_list, $curry_function->($l));
		}
	}

	return @applied_function_list;
}

1;
