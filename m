From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] RLIMIT_DATA affects mmap (2) since 4.7
Date: Thu, 14 Sep 2017 17:54:33 +0200
Message-ID: <98888eaa-82a0-70fc-4867-f1933d74795c@gmail.com>
References: <CA+Y64xNppz0LDR1UoK48mnP2DcTPLefpD4U6LBZ4qQYvifSHcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Y64xNppz0LDR1UoK48mnP2DcTPLefpD4U6LBZ4qQYvifSHcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Grabber <jobegrabber-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jonas,

On 08/28/2017 04:10 PM, Jonas Grabber wrote:
>  From 9e3c8ac6f7ac8a490e020eea5dc68fca5244b354 Mon Sep 17 00:00:00 2001
> From: Jonas Grabber <jobegrabber-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Mon, 28 Aug 2017 16:08:15 +0200
> Subject: [PATCH] RLIMIT_DATA affects mmap (2) since 4.7
> 
> Starting with Linux kernel 4.5 and 84638335900f1995495838fe1bd4870c43ec1f67
> (mm: rework virtual memory accounting) RLIMIT_DATA affects mmap (2).
> With d977d56ce5b3e8842236f2f9e7483d4914c9592e (mm: warn about VmData
> over RLIMIT_DATA) only warnings are emmitted when going over the
> specified RLIMIT_DATA in 4.5.
> 
> As of 4.7 and f4fcd55841fc9e46daac553b39361572453c2b88 (mm: enable
> RLIMIT_DATA by default with workaround for valgrind) going over
> RLIMIT_DATA through mmap (2) is forbidden.
> 
> This updates man-pages 4.13 to reflect these changes.

Thanks for the patch! Applied.

Cheers,

Michael


> ---
>   man2/getrlimit.2 | 11 ++++++++---
>   man2/mmap.2      |  8 ++++++++
>   man3/malloc.3    |  2 +-
>   3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index 84f04d695..fd414fc54 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -179,9 +179,14 @@ perform an orderly termination upon first receipt of
>   This is the maximum size of the process's data segment (initialized data,
>   uninitialized data, and heap).
>   This limit affects calls to
> -.BR brk (2)
> -and
> -.BR sbrk (2),
> +.BR brk (2),
> +.BR sbrk (2)
> +and as of Linux 4.7 also
> +.BR mmap (2)
> +.\" commits 84638335900f1995495838fe1bd4870c43ec1f67
> +.\" ("mm: rework virtual memory accounting"),
> +.\" f4fcd55841fc9e46daac553b39361572453c2b88
> +.\" (mm: enable RLIMIT_DATA by default with workaround for valgrind).
>   which fail with the error
>   .B ENOMEM
>   upon encountering the soft limit of this resource.
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index df527809e..e5f134e4f 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -493,6 +493,14 @@ when unmapping a region in the middle of an
> existing mapping,
>   since this results in two smaller mappings on either side of
>   the region being unmapped.
>   .TP
> +.B ENOMEM
> +(since Linux 4.7)
> +The process's
> +.B RLIMIT_DATA
> +limit, described in
> +.BR getrlimit (2),
> +would have been exceeded.
> +.TP
>   .B EOVERFLOW
>   On 32-bit architecture together with the large file extension
>   (i.e., using 64-bit
> diff --git a/man3/malloc.3 b/man3/malloc.3
> index d0e12fcfc..ac78662f7 100644
> --- a/man3/malloc.3
> +++ b/man3/malloc.3
> @@ -292,7 +292,7 @@ Allocations performed using
>   .BR mmap (2)
>   are unaffected by the
>   .B RLIMIT_DATA
> -resource limit (see
> +resource limit only prior to Linux kernel 4.7 (see
>   .BR getrlimit (2)).
>   .PP
>   To avoid corruption in multithreaded applications,
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
