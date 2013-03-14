From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.4: Document write and document the ioctl interface
 of /dev/random
Date: Thu, 14 Mar 2013 11:23:07 +0100
Message-ID: <CAKgNAkhoOq6kqxyCMCP2LbqS6h6e8tdtDi4nNoOfeb_1u4XnNw@mail.gmail.com>
References: <1361125279-9359-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361125279-9359-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie,

On Sun, Feb 17, 2013 at 7:21 PM, Elie De Brauwer
<eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Michael, all,
>
> Below you can find an update to random.4. The update consists out of
> two parts:
>  - a minor thing which just documents what happens if a write to
>    /dev/(u)random is performed, which is used in the example script
>    but not explicitely mentioned.
>  - the other (biggest) part is the documentation of the ioctl()
>    interface which /dev/(u)random exposes. This ioctl() lives in
>    drivers/char/random.c and the primitives can be found in
>    include/linux/random.h
>
> One comment remains, there used to be an RNDGETPOOL ioctl() which
> disappeared in v2.6.9. I found two patches on the net:
> - http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.8.1/2.6.8.1-mm4/broken-out/dev-random-remove-rndgetpool-ioctl.patch
> - https://lkml.org/lkml/2004/3/25/168
>
> But as far as I can tell the first one got applied but the 2nd one
> seems more correct. The result is that even today one can still find
> traces of the RNDGETPOOL ioctl() in the header files. Is this there for
> historical reasons or because it might break userspace, even though using
> it will just give an EINVAL.
>
> Anyhow, feedback welcome.

Thanks for this. I've applied.

Cheers,

Michael


> my 2 cent
> E.
>
>
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man4/random.4 |   63 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/man4/random.4 b/man4/random.4
> index ed35fd9..d9be11e 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -14,9 +14,13 @@
>  .\"     Add a Usage subsection that recommends most users to use
>  .\"     /dev/urandom, and emphasizes parsimonious usage of /dev/random.
>  .\"
> -.TH RANDOM 4 2010-08-29 "Linux" "Linux Programmer's Manual"
> +.TH RANDOM 4 2013-02-17 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  random, urandom \- kernel random number source devices
> +.SH SYNOPSIS
> +#include <linux/random.h>
> +.sp
> +.BI "int ioctl(" fd ", RND" request ", " param ");"
>  .SH DESCRIPTION
>  The character special files \fI/dev/random\fP and
>  \fI/dev/urandom\fP (present since Linux 1.3.30)
> @@ -49,6 +53,12 @@ literature, but it is theoretically possible that such an attack may
>  exist.
>  If this is a concern in your application, use \fI/dev/random\fP
>  instead.
> +.LP
> +Writing to \fI/dev/random\fP or \fI/dev/urandom\fP will update the
> +entropy pool with the data written, but this will not result in a
> +higher entropy count. This means that it will impact the contents
> +read from both files but it will not make reads from
> +\fI/dev/random\fP faster.
>  .SS Usage
>  If you are unsure about whether you should use
>  .IR /dev/random
> @@ -206,6 +216,57 @@ and
>  contain random strings like 6fd5a44b-35f4-4ad4-a9b9-6b9be13e1fe9.
>  The former is generated afresh for each read, the latter was
>  generated once.
> +.SS ioctl(2) interface
> +The following
> +.BR ioctl (2)
> +requests are defined on file descriptors connected to either \fI/dev/random\fP
> +or \fI/dev/urandom\fP. All requests performed will interact with the input
> +entropy pool impacting both \fI/dev/random\fP and \fI/dev/urandom\fP.
> +The
> +.B CAP_SYS_ADMIN
> +capability is required for all requests except
> +.B RNDGETENTCNT.
> +.TP
> +.BR RNDGETENTCNT
> +Retrieve the entropy count of the input pool, the contents will be the same
> +as the
> +.I entropy_avail
> +file under proc.
> +The result will be stored in the int pointed to by the argument.
> +.TP
> +.BR RNDADDTOENTCNT
> +Increment or decrement the entropy count of the input pool by the value pointed
> +to by the argument.
> +.TP
> +.BR RNDGETPOOL
> +Removed in Linux 2.6.9.
> +.TP
> +.BR RNDADDENTROPY
> +Add some additional entropy to the input pool, incrementing the entropy count.
> +Unlike writing to \fI/dev/random\fP or \fI/dev/urandom\fP which only adds some
> +data but does not increment the entropy count. The following structure is used:
> +.IP
> +.IN +4n
> +.NF
> +struct rand_pool_info {
> +    int    entropy_count;
> +    int    buf_size;
> +    __u32  buf[0];
> +};
> +.FI
> +.IN
> +.IP
> +Here
> +.I entropy_count
> +is the value added to (or subtracted from) from the entropy count. And
> +.I buf
> +is the buffer of size
> +.I buf_size
> +which gets added to the entropy pool.
> +.TP
> +.BR RNDZAPENTCNT ", " RNDCLEARPOOL
> +Zero the entropy count of all pools and add some system data (such as
> +wall clock) to the pools.
>  .SH FILES
>  /dev/random
>  .br
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
