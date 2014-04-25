From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fcntl: F_GETFL: return value contains additional
 internal flags
Date: Fri, 25 Apr 2014 15:46:32 +0200
Message-ID: <CAKgNAkgi3XZY4v8JBPZjP=5sOmKpQPEMbaFJ8OSRnMW-+PyxLQ@mail.gmail.com>
References: <1398369940-13673-1-git-send-email-xypron.glpk@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398369940-13673-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On Thu, Apr 24, 2014 at 10:05 PM, Heinrich Schuchardt
<xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> flags = fcntl(fd, F_GETFL);
>
> can return more flags than those defined in the open(2) manpage, e.g.
>   #define FMODE_NONOTIFY 0x1000000
>
> The manpage should point this out.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>

I think it might be good to mention a concrete example here. So, how
about explicitly mentioning the FMODE_NONOTIFY and the fanotify(7) man
page. Could you redraft?

Thanks,

Michael


> ---
>  man2/fcntl.2 | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/man2/fcntl.2 b/man2/fcntl.2
> index fc1d3b3..0fd2d0a 100644
> --- a/man2/fcntl.2
> +++ b/man2/fcntl.2
> @@ -180,6 +180,9 @@ The file status flags and their semantics are described in
>  Get the file access mode and the file status flags;
>  .I arg
>  is ignored.
> +The return value contains the file status flags as described in
> +.IR open (2).
> +It may additionally contain status flags that are only used internally.
>  .TP
>  .BR F_SETFL " (\fIint\fP)"
>  Set the file status flags to the value specified by
> --
> 1.9.2
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
