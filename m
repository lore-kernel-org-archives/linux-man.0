From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH manpages 2/2] arch_prctl.2, set_thread_area.2, get_thread_area.2:
 Improve TLS documentation
Date: Fri, 30 Jan 2015 13:59:26 +0100
Message-ID: <54CB802E.3050806@gmail.com>
References: <cover.1422568013.git.luto@amacapital.net> <eea75b78032d04f45ba1f33626b26f6b4f5c8ca3.1422568013.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eea75b78032d04f45ba1f33626b26f6b4f5c8ca3.1422568013.git.luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andy,

Thanks for this!

I've merged this into a branch and done some light editing. 
A few questions below.

On 01/29/2015 10:47 PM, Andy Lutomirski wrote:
> The documentation for set_thread_area was very vague.  This improves
> it, accounts for recent kernel changes, and merges it with
> get_thread_area.2.

(Yep, merging seems a good idea.)
> 
> While I'm at it, clarify the related arch_prctl.2 man page.
> 
> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
> ---
>  man2/arch_prctl.2      | 22 +++++++-----
>  man2/get_thread_area.2 | 58 +------------------------------
>  man2/set_thread_area.2 | 93 ++++++++++++++++++++++++++++++++++++++++++++++----
>  3 files changed, 102 insertions(+), 71 deletions(-)
> 
> diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
> index a3ab2b566915..c89fa3c7b744 100644
> --- a/man2/arch_prctl.2
> +++ b/man2/arch_prctl.2
> @@ -114,27 +114,33 @@ The 64-bit base changes when a new 32-bit segment selector is loaded.
>  is disabled in some kernels.
>  
>  Context switches for 64-bit segment bases are rather expensive.
> -It may be a faster alternative to set a 32-bit base using a
> -segment selector by setting up an LDT with
> -.BR modify_ldt (2)
> -or using the
> +As an optimization, if a 32-bit TLS base address is used,
> +.BR arch_prctl (2)
> +may use a real TLS entry as if
>  .BR set_thread_area (2)
> -system call in kernel 2.5 or later.
> -.BR arch_prctl ()
> -is needed only when you want to set bases that are larger than 4GB.
> +had been called instead of manipulating the segment base register directly.
>  Memory in the first 2GB of address space can be allocated by using
>  .BR mmap (2)
>  with the
>  .B MAP_32BIT
>  flag.
>  
> +As a result, using

Something doesn't quite flow here. "As a result" *of what*? Should this rather 
be something like:

    Because of the aforementioned optimization, using

> +.BR arch_prctl (2)
> +and
> +.BR set_thread_area (2)
> +in the same thread is dangerous, as they may overwrite each other's
> +TLS entries.
> +
>  As of version 2.7, glibc provides no prototype for
>  .BR arch_prctl ().
>  You have to declare it yourself for now.
>  This may be fixed in future glibc versions.
>  
>  .I FS
> -may be already used by the threading library.
> +may be already used by the threading library.  Glibc programs that use

What is a "Glibc program"?

> +.I ARCH_SET_FS
> +directly are very likely to crash.
>  .SH SEE ALSO
>  .BR mmap (2),
>  .BR modify_ldt (2),
> diff --git a/man2/get_thread_area.2 b/man2/get_thread_area.2
> index 08589e413cc4..a03fe54fb08e 100644
> --- a/man2/get_thread_area.2
> +++ b/man2/get_thread_area.2
> @@ -1,57 +1 @@
> -.\" Copyright (C) 2003 Free Software Foundation, Inc.
> -.\" Written by Kent Yoder.
> -.\"
> -.\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
> -.\" This file is distributed according to the GNU General Public License.
> -.\" %%%LICENSE_END
> -.\"
> -.TH GET_THREAD_AREA 2 2012-07-13 "Linux" "Linux Programmer's Manual"
> -.SH NAME
> -get_thread_area \- get a thread-local storage (TLS) area
> -.SH SYNOPSIS
> -.B #include <linux/unistd.h>
> -.br
> -.B #include <asm/ldt.h>
> -.sp
> -.BI "int get_thread_area(struct user_desc *" u_info );
> -
> -.IR Note :
> -There is no glibc wrapper for this system call; see NOTES.
> -.SH DESCRIPTION
> -.BR get_thread_area ()
> -returns an entry in the current thread's thread-local storage (TLS) array.
> -The index of the entry corresponds to the value
> -of \fIu_info\->entry_number\fP, passed in by the user.
> -If the value is in bounds,
> -.BR get_thread_area ()
> -copies the corresponding
> -TLS entry into the area pointed to by \fIu_info\fP.
> -.SH RETURN VALUE
> -.BR get_thread_area ()
> -returns 0 on success.
> -Otherwise, it returns \-1 and sets
> -.I errno
> -appropriately.
> -.SH ERRORS
> -.TP
> -.B EFAULT
> -\fIu_info\fP is an invalid pointer.
> -.TP
> -.B EINVAL
> -\fIu_info\->entry_number\fP is out of bounds.
> -.SH VERSIONS
> -A version of
> -.BR get_thread_area ()
> -first appeared in Linux 2.5.32.
> -.SH CONFORMING TO
> -.BR get_thread_area ()
> -is Linux-specific and should not be used in programs
> -that are intended to be portable.
> -.SH NOTES
> -Glibc does not provide a wrapper for this system call,
> -since it is generally intended for use only by threading libraries.
> -In the unlikely event that you want to call it directly, use
> -.BR syscall (2).
> -.SH SEE ALSO
> -.BR modify_ldt (2),
> -.BR set_thread_area (2)
> +.so man2/set_thread_area.2
> diff --git a/man2/set_thread_area.2 b/man2/set_thread_area.2
> index 321beb396312..6acc5f79d1ad 100644
> --- a/man2/set_thread_area.2
> +++ b/man2/set_thread_area.2
> @@ -1,25 +1,54 @@
>  .\" Copyright (C) 2003 Free Software Foundation, Inc.
> +.\" Copyright (C) 2015 Andrew Lutomirski
>  .\" Author: Kent Yoder
>  .\"
>  .\" %%%LICENSE_START(GPL_NOVERSION_ONELINE)
>  .\" This file is distributed according to the GNU General Public License.
>  .\" %%%LICENSE_END
>  .\"
> -.TH SET_THREAD_AREA 2 2012-07-13 "Linux" "Linux Programmer's Manual"
> +.TH SET_THREAD_AREA 2 2015-01-29 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> -set_thread_area \- set a thread local storage (TLS) area
> +set_thread_area \- set a GDT entry for thread-local storage
>  .SH SYNOPSIS
>  .B #include <linux/unistd.h>
>  .br
>  .B #include <asm/ldt.h>
>  .sp
> +.BI "int get_thread_area(struct user_desc *" u_info );
>  .BI "int set_thread_area(struct user_desc *" u_info );
> +.in +4n
> +.nf
> +
> +struct user_desc {
> +    unsigned int  entry_number;
> +    unsigned long base_addr;
> +    unsigned int  limit;
> +    unsigned int  seg_32bit:1;
> +    unsigned int  contents:2;
> +    unsigned int  read_exec_only:1;
> +    unsigned int  limit_in_pages:1;
> +    unsigned int  seg_not_present:1;
> +    unsigned int  useable:1;
> +};
> +.fi
> +.in
>  
>  .IR Note :
>  There is no glibc wrapper for this system call; see NOTES.
>  .SH DESCRIPTION
> +Linux dedicates three global descriptor table (GDT) entries for
> +thread-local storage.  For more information about the LDT, see the

s/LDT/GDT? in the previous line, right?

> +Intel Software Developer's Manual or the AMD Architecture Programming Manual.
> +
> +.BR get_thread_area ()
> +reads the GDT entry indicated by
> +.I u_info\->entry_number
> +and fills in the rest of the fields in
> +.I u_info.
> +
>  .BR set_thread_area ()
> -sets an entry in the current thread's thread-local storage (TLS) array.
> +sets a TLS entry in the GDT.
> +.PP
>  The TLS array entry set by
>  .BR set_thread_area ()
>  corresponds to the value of
> @@ -27,7 +56,7 @@ corresponds to the value of
>  passed in by the user.
>  If this value is in bounds,
>  .BR set_thread_area ()
> -copies the TLS descriptor pointed to by
> +writes the TLS descriptor pointed to by
>  .I u_info
>  into the thread's TLS array.
>  .PP
> @@ -35,12 +64,29 @@ When
>  .BR set_thread_area ()
>  is passed an
>  .I entry_number
> -of \-1, it uses a free TLS entry.
> +of \-1, it finds a free TLS entry.

s/finds/searched for/ ?

>  If
>  .BR set_thread_area ()
>  finds a free TLS entry, the value of
>  .I u_info\->entry_number
>  is set upon return to show which entry was changed.
> +.PP
> +A
> +.I user_desc
> +is considered "empty" if
> +.I read_exec_only
> +and
> +.I seg_not_present
> +are set to 1 and all of the other fields are 0.  If an "empty" descriptor
> +is passed to
> +.BR set_thread_area,
> +the corresponding TLS entry will be cleared.  See BUGS for additional
> +details.
> +.PP
> +On Linux 3.19 and newer,
> +.BR set_thread_area ()
> +cannot be used to write non-present segments, 16-bit segments, or code
> +segments, although clearing a segment is still acceptable.
>  .SH RETURN VALUE
>  .BR set_thread_area ()
>  returns 0 on success, and \-1 on failure, with
> @@ -56,6 +102,11 @@ set appropriately.
>  .TP
>  .B ESRCH
>  A free TLS entry could not be located.
> +.B ENOSYS
> +.BR get_thread_area (2)
> +or
> +.BR set_thread_area (2)
> +was invoked as a 64-bit syscall.
>  .SH VERSIONS
>  A version of
>  .BR set_thread_area ()
> @@ -64,10 +115,40 @@ first appeared in Linux 2.5.29.
>  .BR set_thread_area ()
>  is Linux-specific and should not be used in programs that are intended
>  to be portable.
> +.SH BUGS
> +On 64-bit kernels before Linux 3.19, one of the padding bits in

Was that commit e30ab185c490e9a9381385529e0fd32f0a399495 ?

> +.I user_desc,
> +if set, would prevent the descriptor from being considered empty.
> +As a result, the only reliable way to clear a TLS entry is to use
> +memset to zero the entire
> +.I user_desc
> +structure, including padding bits, and then to set the
> +.I read_exec_only
> +and
> +.I seg_not_present
> +bits.  On Linux 3.19, a
> +.I user_desc
> +consisting entirely of zeros except for
> +.I entry_number
> +will also be interpreted as a request to clear a TLS entry, but this
> +behaved differently on older kernels.
> +.PP
> +Prior to Linux 3.19, the DS and ES segment registers must not reference
> +TLS entries.
>  .SH NOTES
>  Glibc does not provide a wrapper for this system call,
>  since it is generally intended only for use by threading libraries.
>  In the unlikely event that you want to call it directly, use
>  .BR syscall (2).
> +.PP
> +.BR arch_prctl (2)
> +can interfere with
> +.BR set_thread_area (2).
> +See
> +.BR arch_prctl (2)
> +for more details.  This is not normally a problem, as
> +.BR arch_prctl (2)
> +is normally only used by 64-bit programs.
>  .SH SEE ALSO
> -.BR get_thread_area (2)
> +.BR arch_prctl (2),
> +.BR modify_ldt (2)

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
