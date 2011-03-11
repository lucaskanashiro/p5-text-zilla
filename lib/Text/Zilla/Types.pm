package Text::Zilla::Types;
# ABSTRACT: Type library for Text::Zilla

use MooseX::Types -declare => [qw(
	TzilFile
	TzilDir
	TzilFileOrDir
	TzilDirEntries
)];

use MooseX::Types::Moose qw/HashRef/;

role_type TzilFile, { role => 'Text::Zilla::Role::File' };
role_type TzilDir, { role => 'Text::Zilla::Role::Dir' };

subtype TzilFileOrDir, as TzilFile|TzilDir;

subtype TzilDirEntries, as HashRef[TzilFileOrDir];

1;