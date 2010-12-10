class perk::Compiler is HLL::Compiler;

INIT {
    perk::Compiler.language('perk');
    perk::Compiler.parsegrammar(perk::Grammar);
    perk::Compiler.parseactions(perk::Actions);
}
