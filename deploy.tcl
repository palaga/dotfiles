#! /usr/bin/env tclsh
#
# Custom TCL script to deploy my files.
# Customized to my needs.

set DEST $env(HOME)

proc wrap {func before after} {
  proc $func [info args $func] "$before; [info body $func]; $after"
}

# Using [exec ln], because jimsh doesn't support [file link].
proc ln {from to} {
  exec ln -s [file normalize $from] [file normalize $to]
}

proc islinkto {link target} {
  set abstarg [file normalize $target]
  set err [
    catch {
      set link [file readlink $link]
    }
  ]

  return [expr {(!$err && $link == $abstarg) ? 1 : 0}]
}

proc link {src dst} {
  set texists [file exists $dst]
  set fexists [file exists $src]
  set lnerror "Destination file \"$dst\" exists and is not a link to \"$src\""

  if {$fexists} {
    if {!$texists} {
      ln $src $dst
      return created
    } elseif {[islinkto $dst $src]} {
      return exists
    } else { error $lnerror }
  } else { error "Source file \"$src\" doesn't exist" }
}


wrap link {puts "LINK!"} {}

link test blabla

