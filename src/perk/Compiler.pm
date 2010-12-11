class Perk::Compiler is HLL::Compiler;

INIT {
    pir::load_bytecode("nqp-setting.pbc");
    Perk::Compiler.language('perk');
    Perk::Compiler.parsegrammar(Perk::Grammar);
    Perk::Compiler.parseactions(Perk::Actions);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 filetype=perl6:
