From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: networks.5 man page
Date: Tue, 02 Sep 2008 11:21:11 +0200
Message-ID: <48BD0587.4080803@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Martin (Joey) Schulze" <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Joey,

I see that Debian downstream has a networks(5) page (below) that you
wrote some years back (before my time as maintainer).  It seems
to me that it might make sense to take this page upstream.
What do you think?

Cheers,

Michael

PS The FreeBSD networks(5) page has some details not in your page
http://www.freebsd.org/cgi/man.cgi?query=networks&apropos=0&sektion=0&manpath=FreeBSD+7.0-RELEASE&format=html
Perhaps some of those details might also be usefully
covered in your page?

.\" Copyright (c) 2001 Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
.\"
.\" This is free documentation; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License as
.\" published by the Free Software Foundation; either version 2 of
.\" the License, or (at your option) any later version.
.\"
.\" The GNU General Public License's references to "object code"
.\" and "executables" are to be interpreted as the output of any
.\" document formatting or typesetting system, including
.\" intermediate and printed output.
.\"
.\" This manual is distributed in the hope that it will be useful,
.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
.\" GNU General Public License for more details.
.\"
.\" You should have received a copy of the GNU General Public
.\" License along with this manual; if not, write to the Free
.\" Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139,
.\" USA.
.\"
.TH NETWORKS 5 2001-12-22 "GNU/Linux" "Linux System Administration"
.SH NAME
networks \- network name information
.SH DESCRIPTION
The file
.I /etc/networks
is a plain ASCII file that describes known DARPA networks and symbolic
names for these networks.
Each line represents a network and has the following structure:

.RS
.I name number aliases ...
.RE

where the fields are delimited by spaces or tabs.
Empty lines are ignored.
If a line contains a hash mark (#), the hash mark and the remaining
part of the line are ignored.

The field descriptions are:

.TP
.I name
The symbolic name for the network.
.TP
.I number
The official number for this network in dotted-decimal notation.
The trailing ".0" may be omitted.
.TP
.I aliases
Optional aliases for the network.
.LP

This file is read by
.B route
or
.B netstat
utilities.
Only Class A, B or C networks are supported, partitioned networks
(i.e. network/26 or network/28) are not supported by this facility.
.SH FILES
.TP
.I /etc/networks
The networks definition file.
.SH "SEE ALSO"
.BR getnetbyaddr (3),
.BR getnetbyname (3),
.BR getnetent (3),
.BR route (8),
.BR netstat (8)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
