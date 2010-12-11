class Perk::Compiler is HLL::Compiler;

INIT {
    Perk::Compiler.language('perk');
    Perk::Compiler.parsegrammar(Perk::Grammar);
    Perk::Compiler.parseactions(Perk::Actions);
}
