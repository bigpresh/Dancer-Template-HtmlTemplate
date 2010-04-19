use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Dancer::Template::HtmlTemplate',
    AUTHOR              => q{David Precious <davidp@preshweb.co.uk>},
    VERSION_FROM        => 'lib/Dancer/Template/HtmlTemplate.pm',
    ABSTRACT_FROM       => 'lib/Dancer/Template/HtmlTemplate.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Dancer-Template-HtmlTemplate-*' },
);
