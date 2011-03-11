package Text::Zilla::Role::Rights;
# ABSTRACT: Required role for all files
use Moose::Role;

sub tzil_r { shift->tzil_is_readable(@_) }
has tzil_is_readable => (
	is => 'ro',
	isa => 'Bool',
	default => sub { 1 },
);

sub tzil_w { shift->tzil_is_writeable(@_) }
has tzil_is_writeable => (
	is => 'ro',
	isa => 'Bool',
	default => sub { 0 },
);

sub tzil_x { shift->tzil_is_executable(@_) }
has tzil_is_executable => (
	is => 'ro',
	isa => 'Bool',
	default => sub { 0 },
);

1;