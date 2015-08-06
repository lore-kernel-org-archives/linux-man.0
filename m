From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] __ppc_yield.3: Document new glibc function
Date: Thu, 06 Aug 2015 14:36:46 +0200
Message-ID: <55C354DE.8070808@gmail.com>
References: <1438802947-4372-1-git-send-email-gftg@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438802947-4372-1-git-send-email-gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gabriel F. T. Gomes" <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tuliom-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, krisman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Gabriel,

On 08/05/2015 09:29 PM, Gabriel F. T. Gomes wrote:
> GNU C Library 2.18 adds functions to hint a processor that performance
> could be improved if shared resources are released for use by other
> processors.

Thanks for the patch. I've applied, but see a comment below.

> Signed-off-by: Gabriel F. T. Gomes <gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man3/__ppc_mdoio.3 |  1 +
>  man3/__ppc_mdoom.3 |  1 +
>  man3/__ppc_yield.3 | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 man3/__ppc_mdoio.3
>  create mode 100644 man3/__ppc_mdoom.3
>  create mode 100644 man3/__ppc_yield.3
> 
> diff --git a/man3/__ppc_mdoio.3 b/man3/__ppc_mdoio.3
> new file mode 100644
> index 0000000..c9f047f
> --- /dev/null
> +++ b/man3/__ppc_mdoio.3
> @@ -0,0 +1 @@
> +.so man3/__ppc_yield.3
> diff --git a/man3/__ppc_mdoom.3 b/man3/__ppc_mdoom.3
> new file mode 100644
> index 0000000..c9f047f
> --- /dev/null
> +++ b/man3/__ppc_mdoom.3
> @@ -0,0 +1 @@
> +.so man3/__ppc_yield.3
> diff --git a/man3/__ppc_yield.3 b/man3/__ppc_yield.3
> new file mode 100644
> index 0000000..6a06cc9
> --- /dev/null
> +++ b/man3/__ppc_yield.3
> @@ -0,0 +1,96 @@
> +.\" Copyright (c) 2015, IBM Corporation.
> +.\"
> +.\" %%%LICENSE_START(VERBATIM)
> +.\" Permission is granted to make and distribute verbatim copies of this
> +.\" manual provided the copyright notice and this permission notice are
> +.\" preserved on all copies.
> +.\"
> +.\" Permission is granted to copy and distribute modified versions of
> +.\" this manual under the conditions for verbatim copying, provided that
> +.\" the entire resulting derived work is distributed under the terms of
> +.\" a permission notice identical to this one.
> +.\"
> +.\" Since the Linux kernel and libraries are constantly changing, this
> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
> +.\" no responsibility for errors or omissions, or for damages resulting.
> +.\" from the use of the information contained herein.  The author(s) may.
> +.\" not have taken the same level of care in the production of this.
> +.\" manual, which is licensed free of charge, as they might when working.
> +.\" professionally.
> +.\"
> +.\" Formatted or processed versions of this manual, if unaccompanied by
> +.\" the source, must acknowledge the copyright and authors of this work.
> +.\" %%%LICENSE_END
> +.\"
> +.\" Process this file with
> +.\" groff -man -Tascii foo.1
> +.\"
> +.TH __PPC_YIELD 3 2015-08-05 "GNU C Library" "Linux Programmer's\
> +Manual"
> +.SH NAME
> +__ppc_yield, __ppc_mdoio, __ppc_mdoom \-
> +Hint the processor to release shared resources
> +.SH SYNOPSIS
> +.B #include <sys/platform/ppc.h>
> +.sp
> +.B void __ppc_yield(void);
> +.br
> +.B void __ppc_mdoio(void);
> +.br
> +.B void __ppc_mdoom(void);
> +.SH DESCRIPTION
> +The functions
> +.BR __ppc_yield (),
> +.BR __ppc_mdoio ()
> +and
> +.BR __ppc_mdoom ()
> +provide hints about the usage of resources that are shared with other
> +processors.
> +They can be used, for example, if a program waiting on a lock intends
> +to divert the shared resources to be used by other processors.
> +More information is available in Power ISA 2.06b - Book II - Section

I removed the "2.06b", since that seems superfluous: it's a version number
where the minor version number increases now and then (already there is 2.07).
Okay?

> +3.2.
> +.P
> +.BR __ppc_yield ()
> +provides a hint that performance will probably be improved if shared
> +resources dedicated to the executing processor are released for use by
> +other processors.
> +.P
> +.BR __ppc_mdoio ()
> +provides a hint that performance will probably be improved if shared
> +resources dedicated to the executing processor are released until all
> +outstanding storage accesses to caching-inhibited storage have been
> +completed.
> +.P
> +.BR __ppc_mdoom ()
> +provides a hint that performance will probably be improved if shared
> +resources dedicated to the executing processor are released until all
> +outstanding storage accesses to cacheable storage for which the data
> +is not in the cache have been completed.
> +.SH VERSIONS
> +GNU C Library added support for
> +.BR __ppc_yield (),
> +.BR __ppc_mdoio ()
> +and
> +.BR __ppc_mdoom ()
> +in version 2.18.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.ad l
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR __ppc_yield (),
> +.BR __ppc_mdoio (),
> +.BR __ppc_mdoom ()
> +T}	Thread safety	MT-Safe
> +.TE
> +.ad
> +.SH CONFORMING TO
> +These functions are nonstandard GNU extensions.
> +.SH SEE ALSO
> +.BR __ppc_set_ppr_med (3)

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
