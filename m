From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: get_phys_pages.3 review
Date: Mon, 04 May 2015 10:08:18 +0200
Message-ID: <554728F2.6050406@gmail.com>
References: <55468DF3.3070908@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55468DF3.3070908-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello William,

On 05/03/2015 11:06 PM, William Woodruff wrote:
> Hello all,
> 
> I've drafted a man page for two glib functions that haven't been
> documented by the man-pages project yet: get_phys_pages(3) and
> get_avphys_pages(3).
> 
> This is my first whole file contribution, so I was hoping I could
> get some suggestions/pointers before submitting the actual patch :).
> 
> I based it largely on get_nprocs(3) manual page.

Thanks for tackling this. Some comments below.

> Copied below:
> 
> .\" Copyright (c) 2015 William Woodruff (william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org)
> .\"
> .\" %%%LICENSE_START(VERBATIM)
> .\" Permission is granted to make and distribute verbatim copies of this
> .\" manual provided the copyright notice and this permission notice are
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of this
> .\" manual under the conditions for verbatim copying, provided that the
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, this
> .\" manual page may be incorrect or out-of-date.  The author(s) assume no
> .\" responsibility for errors or omissions, or for damages resulting from
> .\" the use of the information contained herein.  The author(s) may not
> .\" have taken the same level of care in the production of this manual,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied by
> .\" the source, must acknowledge the copyright and authors of this work.
> .\" %%%LICENSE_END
> .\"
> .TH GET_PHYS_PAGES 3  2015-03-02 "GNU" "Linux Programmer's Manual"
> .SH NAME
> get_phys_pages, get_avphys_pages \- get total and available physical
> page counts
> .SH SYNOPSIS
> .nf
> .B "#include <sys/sysinfo.h>"
> .sp
> .B long int get_phys_pages(void);
> .B long int get_av_phys_pages(void);
> .SH DESCRIPTION
> The function
> .BR get_phys_pages ()
> returns the total number of physical pages of memory available on the
> system.
> .sp

No need for .sp here. Just use a blank line for the para break.

> The function
> .BR get_avphys_pages ()
> returns the number of available physical pages of memory available on the
> system.
> .SH RETURN VALUE
> As given in DESCRIPTION.

Change this to:

[[
On success, these functions return a nonnegative value
as given in DESCRIPTION.
On failure, they return \-1 and set
.I errno
to indicate the cause of the error.
]]

Taking a look at the glibc source reveals the following possible
errno value:

[[
.SH ERRORS
.TP
.B ENOSYS
The system could not provide the required information
(possibly because the
.I /proc
filesystem was not mounted).
]]

> .SH CONFORMING TO
> These functions are GNU extensions.
> .SH NOTES

I think it might also be useful to note some details about the
implementation here, since it relies on /proc, which may not
be available in some unusual configurations. How about this
paragraph, to give the reader a clue:

[[
These functions obtain the required information by scanning the
.I MemTotal
and
.I MemFree
fields of the file
.IR /proc/meminfo .
]]

> The following
> .BR sysconf (3)
> calls make use of the functions documented on this page to return the same
> information.

It's good that you add this piece, but I think the above text could be
recast to give the reader an important hint:

[[
The following
.BR sysconf (3)
provide a portable means of obtaining the same information
as the functions described on this page.
]]

> .sp

Use a blank line here, not ".sp"

> .nf
>     total_pages = sysconf(_SC_PHYS_PAGES);    /* total pages of memory */
>     avl_pages = sysconf(_SC_AVPHYS_PAGES);    /* available pages of memory*/
> .fi

The two code lines above render wider than 80 characters. Best to
shorten the comments by removing the "of memory" in both lines.

> .SH EXAMPLE
> The following example shows how
> .BR get_phys_pages ()
> and
> .BR get_avphys_pages ()
> can be used.
> .sp
> .nf
> #include <stdio.h>
> #include <sys/sysinfo.h>
> 
> int
> main(int argc, char *argv[])
> {
>     printf("This system has %ld pages of physical memory and "
>             "%ld pages of physical memory available.\\n",
>             get_phys_pages(), get_avphys_pages());
>     return 0;

I prefer

    exit(EXIT_SUCCESS);

here, in which case you'll also need to include <stdlib.h>.

> }
> .fi

Add:

[[
.SH SEE ALSO
.BR sysconf (3)
]]

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
