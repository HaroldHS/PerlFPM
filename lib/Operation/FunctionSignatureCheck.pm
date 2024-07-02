package Operation::FunctionSignatureCheck;

use Exporter "import";
our @EXPORT_OK = qw(check);

sub check {
    my @function_signature_ref = @{$_[0]};
    my $type_signature_flag = 1;

	foreach my $type_string (@type_list) {
		unless ($type =~ /^Type::[a-zA-Z]+$/) {
			$type_signature_flag = 0;
		}
	}

    return $type_signature_flag;
}

1;