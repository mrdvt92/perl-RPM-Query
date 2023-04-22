use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'RPM::Query',
    VERSION_FROM   => 'lib/RPM/Query.pm',
    PREREQ_PM      => {
                       'Package::New' => 0,
                       'List::Util'   => 1.45,
                       'IPC::Run3'    => 0,
                      },
    ABSTRACT_FROM  => 'lib/RPM/Query.pm',
    AUTHOR         => 'Michael R. Davis',
);
