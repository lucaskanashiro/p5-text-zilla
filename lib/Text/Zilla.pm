package Text::Zilla;
# ABSTRACT: Generating files as easy as possible

use Moose ();
use Moose::Exporter;

my ( $import, $unimport, $init_meta ) = Moose::Exporter->setup_import_methods(
	with_meta => [ 'tzil_file', 'tzil_dir' ],
	also      => 'Moose',
    class_metaroles => {
        class       => [ 'Text::Zilla::Role::MetaClass' ],
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

  use Text::Zilla::File;
  use Text::Zilla::Dir;

  my $root = Text::Zilla::Dir->new;
  my $test_txt = Text::Zilla::File->new('This is a test');
  my $testdir = Text::Zilla::Dir->new;
  my $othertest_txt = Text::Zilla::File->new('More tests!');
  $testdir->tzil_set_entry('othertest.txt',$othertest_txt);
  $root->tzil_set_entry('testdir',$testdir);
  $root->tzil_set_entry('test.txt',$test_txt);

  $root->tzil_to('.');

=head1 DESCRIPTION

B<This package is still in development - API may change.>

This distribution tries to make a norm for generating files of any kind. Its for generating specific files like a /etc directory of a unix host, but should also be able to be used for generating 100.000 HTML files for a static webpage.

=head1 SEE ALSO

=for :list
* L<Text::Zilla::Dir>
* L<Text::Zilla::Types>
* L<Text::Zilla::Role::Dir::Stash>
* L<Text::Zilla::Role::Dir::Base>
* L<Text::Zilla::Role::Dir>
* L<Text::Zilla::Role::File::Base>
* L<Text::Zilla::Role::Rights>
* L<Text::Zilla::Role::File>
* L<Text::Zilla::Role::MetaClass>
* L<Text::Zilla::File>

=head1 SUPPORT

IRC

  Join #textzilla on irc.perl.org.

Repository

  http://github.com/Getty/p5-text-zilla
  Pull request and additional contributors are welcome
 
Issue Tracker

  http://github.com/Getty/p5-text-zilla/issues

=cut
