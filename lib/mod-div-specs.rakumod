# Cat licensed from https://github.com/rakudo/rakudo/pull/6070
use nqp;

#- infix div -------------------------------------------------------------------
proto sub infix:<div>($, $, *%) is pure is export {*}
multi sub infix:<div>(Int:D $a, Int:D $b --> Int:D) {
    $b
      ?? nqp::div_I($a,$b,Int)
      !! X::Numeric::DivideByZero.new(:using<div>, :numerator($a)).Failure
}   
    
# relies on opcode or hardware to detect division by 0
multi sub infix:<div>( int $a,  int $b --> int)  { nqp::div_i($a, $b) }  # UNCOVERABLE
multi sub infix:<div>( int $a, uint $b --> int)  { nqp::div_i($a, $b) }  # UNCOVERABLE
multi sub infix:<div>(uint $a,  int $b --> int)  { nqp::div_i($a, $b) }  # UNCOVERABLE
multi sub infix:<div>(uint $a, uint $b --> uint) { nqp::div_i($a, $b) }  # UNCOVERABLE
    
#- infix mod -------------------------------------------------------------------
# NOTE: According to the spec, infix:<mod> is "Not coercive,
# so fails on differing types."  Thus no casts here.
proto sub infix:<mod>($, $, *%) is pure is export {*}
multi sub infix:<mod>(Int:D $a, Int:D $b --> Int:D) {
    $b
      ?? nqp::sub_I($a,nqp::mul_I(nqp::div_I($a,$b,Int),$b,Int),Int)
      !! X::Numeric::DivideByZero.new(:using<mod>, :numerator($a)).Failure
}       
    
# relies on opcode or hardware to detect division by 0
multi sub infix:<mod>( int $a,  int $b --> int)  { nqp::mod_i($a, $b) }  # UNCOVERABLE
multi sub infix:<mod>( int $a, uint $b --> int)  { nqp::mod_i($a, $b) }  # UNCOVERABLE
multi sub infix:<mod>(uint $a,  int $b --> int)  { nqp::mod_i($a, $b) }  # UNCOVERABLE
multi sub infix:<mod>(uint $a, uint $b --> uint) { nqp::mod_i($a, $b) }  # UNCOVERABLE

# vim: expandtab shiftwidth=4
