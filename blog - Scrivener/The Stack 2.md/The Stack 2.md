Title: The Stack  
Author:

# Desired #


I have found that it is convenient to create separate stacks for every type.  

I found that I need only 5 basic operations and that I can generate/compile/transpile code to enact these operations.

The "syntax" for talking about types in this manner, drops to something very small (bizarrely, the number 5 comes up again - I can describe the new syntax using only 5 productions).

I describe this method in the following essay.


![][isolation-Desired]

# Achieving 2 Stacks for Each Type #

## SCL Syntax ##

  id = { ... }     --> class with fields def
  id = :string     --> string def
  id = :map        --> map def
  id = | ...       --> or type def
  id = '...' |  '...' | ...       --> enum def

[This syntax was chosen for its regularity since it was originally parsed with manually written code.  Each construct has a left handle.  Every construct begins with "id = ", then the next character determines the kind of construct, e.g. "id = {" means that the construct is a class with fields, "id = '" means enum, and so on.]

For a prototype of this, see https://github.com/guitarvydas/stack-dsl


## Example Type Specification ##

[comments deleted, for full contents see https://github.com/bmfbp/bmfbp/blob/main/build_process/esa-transpiler/exprtypes.dsl]

esaprogram = { typeDecls situations classes whenDeclarations  }
typeDecls = :map typeDecl
situations = :map situationDefinition
classes = :map esaclass
whenDeclarations = :map whenDeclaration
typeDecl = { name typeName }
situationDefinition =| name
esaclass = { name fieldMap methodsTable }
whenDeclaration = { situationReferenceList esaKind methodDeclarationsAndScriptDeclarations }
situationReferenceList = :map situationReferenceName
situationReferenceName =| name
methodDeclarationsAndScriptDeclarations = :map declarationMethodOrScript
declarationMethodOrScript =| methodDeclaration | scriptDeclaration
methodDeclaration = { esaKind name formalList returnType }
scriptDeclaration = { esaKind name formalList returnType implementation }
returnType = { returnKind name }
returnKind = 'map' | 'simple' | 'void'
formalList = :map name
esaKind =| name
typeName =| name
expression = { ekind object }
ekind = 'true' | 'false' | 'object' | 'calledObject'
object = { name fieldMap }
fieldMap = :map field
field = { name fkind actualParameterList } 
fkind = 'map' | 'simple'
actualParameterList = :map expression
name = :string
methodsTable = :map declarationMethodOrScript
externalMethod = { name formalList returnType }
internalMethod = { name formalList returnType implementation }
implementation = :map statement
statement =| letStatement | mapStatement | exitMapStatement | setStatement | createStatement | ifStatement | loopStatement | exitWhenStatement | callInternalStatement | callExternalStatement | returnTrueStatement | returnFalseStatement | returnValueStatement
letStatement = { varName expression implementation }
mapStatement = { varName expression implementation }
exitMapStatement = { filler } 
setStatement = { lval expression }
createStatement = { varName indirectionKind name implementation }
ifStatement = { expression thenPart elsePart }
loopStatement = { implementation }
exitWhenStatement = { expression }
returnTrueStatement = { methodName }
returnFalseStatement = { methodName }
returnValueStatement = { methodName name }
callInternalStatement = { functionReference } 
callExternalStatement = { functionReference }
lval =| expression
varName =| name
functionReference =| expression
thenPart =| implementation
elsePart =| implementation
indirectionKind = 'indirect' | 'direct'
methodName =| name
filler =| name


## class id = { ... }  ##

 id = { ... }

Defines a class that contains the given fields.

This construct does not explicitly define any methods for the class.

Methods are generated automatically.


## type union id = | ... ##

id = | ...

Defines a type id to be a union of other types.


## enum  id = '...' |  '...' | ...  ##

id = '...' |  '...' | ...

Defines a type to consist of one or more contants (symbols / strings).

## foreign string  id = :string ##

id = :string

Defines a type id to be of a foreign type STRING.

[maybe I should have generalized this to id = :foreign?]

##  foreign list id = :map ##

id = :map  ...

Defines a type id to be a list of some other type.

[maybe I should have named this :list instead of :map]

## Compiling to Separate Stacks ##

I find it useful to have 2 stacks for every type

1. working stack
2. output stack

The example type specification in Example Type Specification defines 54 types.

This compiles to 54 type definitions and 54 * 2 = 108 stacks.

Note that there are only 5 possible ways to define a type.

Note that types can be defined as other types.  For example
…
methodName =| name
…
name = :string
…

Note that "variable names" are not needed.  We simply create a typename for each entity, e.g. 
fn (a: int, b : int)
becomes
fn (a, b)
a =| int
b =| int
(this removes syntactic noise from the declarations and pushes implementation details deeper into the hierarchy).  In this example, a and b are types (not variables).

Each stack contains enough information to:

* specify the type contained in the stack
* the actual stack of values (of the given type)



## Foreign Types ##

There are only 2 types at the bottom:

* a %typed-value: ( %type, %value ) [where %type is a String and %value is anything]
* a list of %typed-value: ( %element-type, %ordered-list ) [where %ordered-list contains %type-values] 

* Both types are foreign and opaque
* Only the implementation knows what is inside of them
* type checking is done by-name (equality of %types)



## Operations ##

I find that there are 6 basic operations:

* NewScope
* EndScope
* Output
* SetField_???_from_???
* AppendFrom_???
* <foreign operation>

The first 5 operations can be automatically generated for every type (and the corresponding stacks).

The 6th operation (<foreign operation>) is a catch-all for operations that are specific to the solution.

In https://github.com/bmfbp/bmfbp/blob/main/build_process/esa-transpiler/dsl3.pasm (and the other dsl*.pasm files), the stack names are prepended to the operations (followed by two underscores), and the typenames are prefixed with "$" e.g.
$whenDeclarations__EndScope
thus, in the prototype, one will see operations, like:

* $formalList__NewScope
* $classes__EndScope
* $formalList__Output
* $scriptDeclaration__SetField_formalList_from_formalList
* $formalList__AppendFrom_name
* <foreign operation>: $name__GetName

### NewScope ###

<type>__NewScope pushes an empty item, of the appropriate type, onto the working stack of the type.

### EndScope ###

<type>__EndScope pops the given working stack.

### Output ###

<type>__Output moves the top item from the working stack to the output stack for the given type.  The working stack is popped (once).

### SetField ###

<type>__SetField_<fieldName>_from_<other-type> sets the field fieldName of type to the value of the top of the Output stack of other-type.

This operation checks that the other-type is of the type required by fieldName.

This operation pops (once) the Output stack of other-type.



### AppendFrom ###

<type>__AppendFrom_<other-type> appends the value of the top of the Output stack of other-type to the top list on the working stack of type.

This operation checks that type is a list (I've called it :map) and that the element-type of the list matches other-type.

This operation pops (once) the Output stack of other-type.



### Foreign ###

<type>__??? performs operation "???" on the given type.

This operation has no arguments (other than type), but multiple operations can be declared and called, e.g. counter__reset … counter__increment … counter__increment_by_2 …

## Example Compilation (Lisp) ##

See https://github.com/bmfbp/bmfbp/blob/main/build_process/esa-transpiler/example-generated-exprtypes.lisp 

See https://github.com/bmfbp/bmfbp/blob/main/build_process/esa-transpiler/example-generated-exprtypes.json

See https://github.com/bmfbp/bmfbp/blob/main/build_process/esa-transpiler/example-generated-mechanisms.lisp

[Push these through your favourite pretty-printer]

[isolation-Desired]: isolation-Desired.png width=1000px height=970px