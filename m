From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: mtrace(1) man page
Date: Sat, 30 Aug 2014 15:34:01 +0200
Message-ID: <5401D2C9.9070100@gmail.com>
References: <53C8E24E.3040704@redhat.com> <CABQpAL4JoZw8VqPNTuxnF2Nk+-zrt8srkzmxtYgi0XK9tC+9cQ@mail.gmail.com> <53CE1E27.5020400@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53CE1E27.5020400-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tushar Shinde <mtk.tushar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jan,

I've merged this page. Thank you for submitting it on Peter's behalf.

Cheers,

Michael


On 07/22/2014 10:17 AM, Jan Chaloupka wrote:
> Hi Tushar,
> 
> On 07/22/2014 09:45 AM, Tushar Shinde wrote:
>> Hi Jan,
>>
>> Is  this MTRACEDATA is same as environment  variable  MALLOC_TRACE 
>> of MTRACE(3) ?
>> If yes we should keep MALLOC_TRACE instead of MTRACEDATA to avoid 
>> confusion.
>>
>> Tushar
> 
> thank you for noticing. Those are script arguments, not environment 
> variables. Changed bold into underline.
> 
> .\" Copyright (c) 2013, Peter Schiffer (pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org)
> .\"
> .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> .\" This is free documentation; you can redistribute it and/or
> .\" modify it under the terms of the GNU General Public License as
> .\" published by the Free Software Foundation; either version 2 of
> .\" the License, or (at your option) any later version.
> .\"
> .\" The GNU General Public License's references to "object code"
> .\" and "executables" are to be interpreted as the output of any
> .\" document formatting or typesetting system, including
> .\" intermediate and printed output.
> .\"
> .\" This manual is distributed in the hope that it will be useful,
> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> .\" GNU General Public License for more details.
> .\"
> .\" You should have received a copy of the GNU General Public
> .\" License along with this manual; if not, see
> .\" <http://www.gnu.org/licenses/>.
> .\" %%%LICENSE_END
> .TH MTRACE 1 2013-04-10 "GNU glibc 2.18" "Memory diagnostic tools"
> .SH NAME
> mtrace \- interpret the malloc trace log
> .SH SYNOPSIS
> .BR mtrace " [\fIOPTION\fR]... [\fIBINARY\fR] \fIMTRACEDATA\fR"
> .SH DESCRIPTION
> .B mtrace
> is a Perl script used to interpret and provide human readable output
> of the trace log created by
> .BR mtrace (3)
> function stored in the
> \fIMTRACEDATA\fR
> file.
> If
> \fIBINARY\fR
> is provided, output of
> .B mtrace
> also contains source file name with line number information
> of problem location
> (assuming that
> \fIBINARY\fR
> was compiled with debugging information).
> 
> For more information about
> .BR mtrace (3)
> function and
> .B mtrace
> script usage, refer to the
> .BR mtrace (3)
> manual page.
> .SH OPTIONS
> .TP
> .BI \fB\-\-help
> Print help and exit.
> .TP
> .BI \fB\-\-version
> Print version information and exit.
> .SH BUGS
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/libc/bugs.html>.
> .SH SEE ALSO
> .BR mtrace (3)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
