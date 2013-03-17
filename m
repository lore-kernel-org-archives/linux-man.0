From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): maps: document the "pathname" field
Date: Sun, 17 Mar 2013 09:57:48 +0100
Message-ID: <CAKgNAkhr2msKaPOJVZq2Pe2vaWGQQTSmQTLdPQ5wRVTcbYVxkw@mail.gmail.com>
References: <1363384034-11106-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363384034-11106-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

Thanks for the patch. I've applied it. A few comments below on pieces
I've fixed and/or have questions about.

I corrected the description to

    Document the "pathname" field *of /proc/PID/maps*

On Fri, Mar 15, 2013 at 10:47 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> Add some info for people who aren't "in the know".
>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man5/proc.5 | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index cd41e06..6755f62 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -367,6 +367,30 @@ p = private (copy on write)
>  0 indicates that no inode is associated with the memory region,
>  as the case would be with BSS (uninitialized data).
>
> +"pathname" will be usually be the file that is backing the mapping.  For ELF

See man-pages(7). I prefer new sentences to start of new source lines.
It makes future patches easier to grok, since often patches operate at
the sentence level.

> +files, You can easily coordinate with the "offset" field by looking at the
> +Offset field in the ELF's program headers (`readelf -l`).

s/ELF's/ELF/

> +
> +There are additional helpful pseudo paths:
> +
> +.nf
> +.in +5
> +[stack]   = The initial process's (aka the main thread's) stack

Avoid abbreviations such as "aka" in favor of the full text.
Non-native speakers especially have a hard time with such
abbreviations.

> +[stack:#] = A thread's stack (where the # is the thread's TID)
> +[vdso]    = The virtual dynamically linked shared object
> +[heap]    = The process's heap (no joke!)

Why "no joke"? I don't get it.

> +.in
> +.fi
> +
> +The TID syntax was added in Linux 3.4.  It corresponds to the
> +.IR /proc/[pid]/task/[TID]/
> +path.
> +
> +If the field is blank, this is an anonymous mapping as obtained via the
> +.BR mmap (2)
> +function.  There is no easy way to coordinate this back to a process's
> +source short of running it through gdb/strace/etc...  Sorry!

I removed "Sorry!" -- it's kind or redundant.

Cheers,

Michael


> +
>  Under Linux 2.0 there is no field giving pathname.
>  .TP
>  .I /proc/[pid]/mem
> --
> 1.8.1.2
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
