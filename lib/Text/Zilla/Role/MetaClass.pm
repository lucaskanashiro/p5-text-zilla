package Text::Zilla::Role::MetaClass;
# ABSTRACT: I'm a little teapot, short and stout. Here is my handle, here is my spout
use Moose::Role;

has tzil_type => (
	is => 'rw',
	isa => 'Str',
	predicate => 'has_tzil_type',
);

before tzil_type => sub {
	my ( $self, $new_type ) = @_;
	return if ( !$new_type or ( $self->has_tzil_type and $new_type eq $self->tzil_type ) );
	die $self->name." already is of type ".$self->tzil_type if $self->has_tzil_type;
};

1;