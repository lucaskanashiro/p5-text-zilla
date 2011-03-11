package Text::Zilla;
# ABSTRACT: Generating files as easy as possible

use Moose ();
use Moose::Exporter;

my ( $import, $unimport, $init_meta ) = Moose::Exporter->setup_import_methods(
	with_meta => [ 'tzil_file', 'tzil_dir' ],
	also      => 'Moose',
    class_metaroles => {
        class       => [ 'Text::Zilla::Meta::Class' ],
    },
);

sub init_meta {
    my ( $class, %args ) = @_;
    my $for = $args{for_class};
    Moose->init_meta( for_class => $for );
    goto $init_meta;
}

sub tzil_file {
	my ( $meta, $file_class_name ) = @_;
	$meta->tzil_type('file');
	$file_class_name = 'Base' if !$file_class_name;
	my $file_class = __PACKAGE__.'::Role::File::'.$file_class_name;
	Moose::with( $meta, $file_class );
}

sub tzil_dir {
	my ( $meta, $dir_class_name ) = @_;
	$meta->tzil_type('dir');
	$dir_class_name = 'Base' if !$dir_class_name;
	my $dir_class = __PACKAGE__.'::Role::Dir::'.$dir_class_name;
	Moose::with( $meta, $dir_class );
}

1;

=head1 SYNOPSIS

=head1 DESCRIPTION

B<This package is still in development - please contact the developers, if you plan to use it and stay on track with the changes.>

This distribution tries to make a norm for generating files of any kind. Its for generating specific files like a /etc directory of a unix host, but should also be able to be used for generating 100.000 HTML files for a static webpage.

=cut
