
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'An atompub server that supports the message queue/bus model.',
  'AUTHOR' => 'Naveed Massjouni <naveed.massjouni@rackspace.com>',
  'BUILD_REQUIRES' => {},
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'AtomMQ',
  'EXE_FILES' => [
    'bin/app.pl'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'AtomMQ',
  'PREREQ_PM' => {
    'Atompub' => '0',
    'Capture::Tiny' => '0',
    'DBD::SQLite' => '0',
    'DBIx::Class' => '0.08115',
    'Dancer' => '1.2002',
    'Dancer::Plugin::DBIC' => '0.1504',
    'SQL::Translator' => '0.11006',
    'UUID::Tiny' => '0.02',
    'XML::Atom' => '0',
    'XML::XPath' => '0'
  },
  'VERSION' => '1.0400',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



