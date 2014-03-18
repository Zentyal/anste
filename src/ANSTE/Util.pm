# Copyright (C) 2014 Rubén Durán Balda <rduran@zentyal.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

package ANSTE::Util;

use strict;
use warnings;

# Function: readChar
#
#   Reads a whole line from the standard input and returns the first character
#
# Returns:
#
#   char - first character read from the standard input
#
sub readChar
{
    my $line = <STDIN>;
    return substr($line, 0, 1);
}

1;
