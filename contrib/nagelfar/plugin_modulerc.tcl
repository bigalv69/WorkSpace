##Nagelfar Plugin : modulerc-specific notices
#
# PLUGIN_MODULEFILE.tcl, Nagelfar plugin to lint modulercs
# Copyright (C) 2022 Xavier Delaruelle
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

##########################################################################

# report deprecated/not implemented usages
proc statementWords {words info} {
   set res {}
   switch [lindex $words 0] {
      module-info {
         if {[lindex $words 1] in {flags trace tracepat user}} {
            set res [list warning "Command \"[lrange $words 0 1]\" is\
               deprecated and not implemented"]
         }
      }
   }
   return $res
}

# report variable that should be renamed
proc varWrite {var info} {
   set res {}
   if {$var eq {ModuleVersion}} {
      set res [list warning "Variable \"$var\" should be renamed\
         \"ModulesVersion\""]
   }
   return $res
}

# vim:set tabstop=3 shiftwidth=3 expandtab autoindent:
