#!/usr/bin/env parrot
# $Id$

=head1 NAME

setup.pir - Python distutils style

=head1 DESCRIPTION

No Configure step, no Makefile generated.

=head1 USAGE

    $ parrot setup.pir build
    $ parrot setup.pir test
    $ sudo parrot setup.pir install

=cut

.sub 'main' :main
    .param pmc args
    $S0 = shift args
    $P0 = read_json('setup.json')
    load_bytecode 'distutils.pbc'
    .tailcall setup(args :flat, $P0 :flat :named)
.end

.sub 'read_json'
    .param string filename
    $S0 = slurp(filename)
    load_language 'data_json'
    $P0 = compreg 'data_json'
    $P1 = $P0.'compile'($S0)
    $P1 = $P1() # eval code to get object
    .return ($P1)
.end

.sub 'slurp'
    .param string filename
    $P0 = new 'FileHandle'
    $P0.'open'(filename, 'r')
    $S0 = $P0.'readall'()
    $P0.'close'()
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

