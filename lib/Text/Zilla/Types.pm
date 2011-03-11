package Text::Zilla::Types;
# ABSTRACT: Type library for Text::Zilla

use MooseX::Types -declare => [qw(
	TzilFile
	TzilDir
	TzilDirEntries
)];

use MooseX::Types::Moose qw/HashRef/;

role_type TzilFile, { class => 'Text::Zilla::Role::File' };
role_type TzilDir, { class => 'Text::Zilla::Role::Dir' };

subtype TzilDirEntries, as HashRef[TzilFile|TzilDir];

1;