`%function name (args)` ... `%endfunciton name (args)`
`%persistent operand`
`%variable name operand`
`%overwrite name operand`
`%switch operand ... %endswitch operand`
`%case operand ... %endcase operand` (note that operands might be strings)
`%verbatim operand`
`%lambda (args) ... %endlambda (args)`
`%cons (operand operand)`
`%enqueue operand operand`  the first operand must evaluate to a port effective address, e.g. `&«me»/kick`
`%yield`
`%mapfunctions operand`