# examples at: http://iolanguage.org/scm/io/docs/reference/index.html

# style guide at: http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

# my preferred community: http://twitter.com/iolanguage

1 + 1
# 1 + "one"
# Can't add a number to a sequence = strongly typed

# 0 seems to be neither true nor false?
0 == true  # false
0 == false # false

# Well, except
if(0, true, false) #=> true... So it's truthy? Truthish?

Object slotNames println

# =   -> assignment (will throw error if slot doesn't exist)
# :=  -> set (will generate a new slow)
# ::= -> newSlot (Will generate new slot AND setter! Cool!)

Animal := Object clone

Animal makeNoise := method("..." println)
Animal name ::= "..."

Dog := Animal clone

Dog makeNoise := method("Woof!" println)

fido := Dog clone
fido setName("Fido")
