From: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Subject: get_phys_pages.3 review
Date: Sun, 03 May 2015 17:06:59 -0400
Message-ID: <55468DF3.3070908@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello all,

I've drafted a man page for two glib functions that haven't been
documented by the man-pages project yet: get_phys_pages(3) and
get_avphys_pages(3).

This is my first whole file contribution, so I was hoping I could
get some suggestions/pointers before submitting the actual patch :).

I based it largely on get_nprocs(3) manual page.

Copied below:

.\" Copyright (c) 2015 William Woodruff (william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org)
.\"
.\" %%%LICENSE_START(VERBATIM)
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of this
.\" manual under the conditions for verbatim copying, provided that the
.\" entire resulting derived work is distributed under the terms of a
.\" permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume no
.\" responsibility for errors or omissions, or for damages resulting from
.\" the use of the information contained herein.  The author(s) may not
.\" have taken the same level of care in the production of this manual,
.\" which is licensed free of charge, as they might when working
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\" %%%LICENSE_END
.\"
.TH GET_PHYS_PAGES 3  2015-03-02 "GNU" "Linux Programmer's Manual"
.SH NAME
get_phys_pages, get_avphys_pages \- get total and available physical
page counts
.SH SYNOPSIS
.nf
.B "#include <sys/sysinfo.h>"
.sp
.B long int get_phys_pages(void);
.B long int get_av_phys_pages(void);
.SH DESCRIPTION
The function
.BR get_phys_pages ()
returns the total number of physical pages of memory available on the
system.
.sp
The function
.BR get_avphys_pages ()
returns the number of available physical pages of memory available on the
system.
.SH RETURN VALUE
As given in DESCRIPTION.
.SH CONFORMING TO
These functions are GNU extensions.
.SH NOTES
The following
.BR sysconf (3)
calls make use of the functions documented on this page to return the same
information.
.sp
.nf
    total_pages = sysconf(_SC_PHYS_PAGES);    /* total pages of memory */
    avl_pages = sysconf(_SC_AVPHYS_PAGES);    /* available pages of memory*/
.fi
.SH EXAMPLE
The following example shows how
.BR get_phys_pages ()
and
.BR get_avphys_pages ()
can be used.
.sp
.nf
#include <stdio.h>
#include <sys/sysinfo.h>

int
main(int argc, char *argv[])
{
    printf("This system has %ld pages of physical memory and "
            "%ld pages of physical memory available.\\n",
            get_phys_pages(), get_avphys_pages());
    return 0;
}
.fi


---
William Woodruff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
