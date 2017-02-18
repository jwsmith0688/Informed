package DBLoader;

## Import Moo object-system ##
use Moo;

## Import 5.24 features ##
use v5.24;

use Exporter 'import';

with 'Role::EventEmitter';

## Symbols to Export ##
our @EXPORT_OK;

## Verison ##
our $VERSION = 1.0;

## Methods ##
sub start {
}

1;

=head1 NAME

DBLoader - Informed's data synchronization framework

=head1 SYNOPSIS

  use DBLoader;

  my $loader = DBLoader->new;

  $load->start;

=head1 DESCRIPTION

L<DBLoader> is a data synchronization framework that supports connecting multiple
data interfaces and is designed to be configurable and customizable via plugins.
A core set of plugins is included from L<DBLoader::Plugin::Core> which includes
basic administrative and configuration commands, and additional plugins can be
registered that may implement any functionality from adding more commands to
hooking into message events and more.

=head1 CONFIGURATION

L<DBLoader> is configured by INI files: one global configuration file and a
data configuration file for each data type. The global configuration file is used
as a default configuration file for each data type. Any configuration specified
in the constructor or when adding a data interface will be written to the configuration
files, overriding existing configuration.

Configuration INI files are organized into sections, and all parameters must be
within a section.

=head2 main



=head1 INTERFACES

Interfaces are represented by L<DBLoader::Interfaces> (or subclassed) objects
that handle all communication with that interface. Interfaces can be specified
in the Loader's constructor, or added later with the L</"interface"> method.

=head1 PLUGINS

Plugins are L<Moo> objects that compose the role L<DBLoader::Plugin>. They are
registered by calling the required method C<register> and may add commands, hooks
or anything else to the loader instance. A plugin may also register a method of
its own as a "helper method" which then can be called on the bot instance from
elsewhere. The plugin object is passed as the invocant of the registered helper
method.
