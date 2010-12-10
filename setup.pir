# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

.sub 'main' :main
    .param pmc argv
    $S0 = shift argv # ignore argv[0]

    load_language 'data_json'
    $P0 = compreg 'data_json'
    $S0 = slurp('setup.json')
    $P1 = $P0.'compile'($S0)
    $P1 = $P1() # extra execute to actually get the object

    load_bytecode 'distutils.pbc'
    .tailcall setup(argv :flat, $P1 :flat :named)
.end

.sub slurp
    .param string filename
    $P0 = new ['FileHandle']
    $P0.'open'(filename)
    $S0 = $P0.'readall'()
    .return ($S0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

