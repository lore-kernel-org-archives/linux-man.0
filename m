From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getpw.3: Function could return -1 and set errno to zero.
Date: Fri, 16 Jan 2015 07:38:35 +0100
Message-ID: <54B8B1EB.4040000@gmail.com>
References: <54B8857F.2060307@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B8857F.2060307-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/16/2015 04:29 AM, Carlos O'Donell wrote:
> All of the BSD interfaces, including glibc's own implementation
> of getpw return -1 and set errno to 0 to indicate that there
> was no user corresponding to that uid.
> 
> I have never under any condition seen an NSS backend return
> ENOENT via the set of APIs that getpw uses internally in
> glibc.
> 
> Therefore I would suggest the manual page be expanded to include
> 0 in the list of valid errno values that indicate no corresponding
> user. I reorganize the list of errors to have the non-error
> at the top, as is done with getgrnam.3 and getpwnam.3 which have
> similar behaviour in the non-error case.
> 
> Patch against master.
> 
> diff --git a/man3/getpw.3 b/man3/getpw.3
> index 4054823..3eed9a7 100644
> --- a/man3/getpw.3
> +++ b/man3/getpw.3
> @@ -77,14 +77,14 @@ function returns 0 on success; on error, it returns \-1, and
>  is set to indicate the error.
>  .SH ERRORS
>  .TP
> +.BR 0 " or " ENOENT
> +No user corresponding to
> +.IR uid .
> +.TP
>  .B EINVAL
>  .I buf
>  is NULL.
>  .TP
> -.B 0 or ENOENT
> -No user corresponding to
> -.IR uid .
> -.TP
>  .B ENOMEM
>  Insufficient memory to allocate
>  .I passwd

Hi Carlos,

This patch was broken. (I think you must have prepared a preceding
patch that you did not send.

I take your point, but I think a little more could be said. I instead
applied the patch below. Okay?

Thanks,

Michael

diff --git a/man3/getpw.3 b/man3/getpw.3
index cf7eb69..9f2732f 100644
--- a/man3/getpw.3
+++ b/man3/getpw.3
@@ -75,16 +75,26 @@ The
 function returns 0 on success; on error, it returns \-1, and
 .I errno
 is set to indicate the error.
+
+If
+.I uid
+is not found in the password database,
+.BR getpw ()
+returns 0, sets
+.I errno
+to 0, and leaves
+.I buf
+unchanged.
 .SH ERRORS
 .TP
+.BR 0 " or " ENOENT
+No user corresponding to
+.IR uid .
+.TP
 .B EINVAL
 .I buf
 is NULL.
 .TP
-.B ENOENT
-No user corresponding to
-.IR uid .
-.TP
 .B ENOMEM
 Insufficient memory to allocate
 .I passwd

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
