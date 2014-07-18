From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: For review: mtrace(1) man page
Date: Fri, 18 Jul 2014 11:01:02 +0200
Message-ID: <53C8E24E.3040704@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

mtrace(1) command is not documented. All informations come from the script.

Feel free to comment or ask any question.

Thank you
Jan

.\" Copyright (c) 2013, Peter Schiffer (pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org)
.\"
.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
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
.\" License along with this manual; if not, see
.\" <http://www.gnu.org/licenses/>.
.\" %%%LICENSE_END
.TH MTRACE 1 2013-04-10 "GNU glibc 2.18" "Memory diagnostic tools"
.SH NAME
mtrace \- interpret the malloc trace log
.SH SYNOPSIS
.BR mtrace " [\fIOPTION\fR]... [\fIBINARY\fR] \fIMTRACEDATA\fR"
.SH DESCRIPTION
.B mtrace
is a Perl script used to interpret and provide human readable output
of the trace log created by
.BR mtrace (3)
function stored in the
.B MTRACEDATA
file.
If
.B BINARY
is provided, output of
.B mtrace
also contains source file name with line number information
of problem location
(assuming that
.B BINARY
was compiled with debugging information).

For more information about
.BR mtrace (3)
function and
.B mtrace
script usage, refer to the
.BR mtrace (3)
manual page.
.SH OPTIONS
.TP
.BI \fB\-\-help
Print help and exit.
.TP
.BI \fB\-\-version
Print version information and exit.
.SH BUGS
For bug reporting instructions, please see:
<http://www.gnu.org/software/libc/bugs.html>.
.SH SEE ALSO
.BR mtrace (3)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
