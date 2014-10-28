From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fallocate.2: add include falloc.h
Date: Tue, 28 Oct 2014 12:44:03 +0100
Message-ID: <CAKgNAkjbRgLen6UTKLH+dJqxwzaqJgTuFzNd45Au1-_6tZF84Q@mail.gmail.com>
References: <1412296670-8745-1-git-send-email-xypron.glpk@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412296670-8745-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On Fri, Oct 3, 2014 at 2:37 AM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> Include linux/falloc.h provides the constants described in the
> manpage.

Yes, but they're also included via fcntl.h (via bits/fcntl.h via
bits/fcntl-linux.h). So this patch seems incorrect to me, so I won;t
apply for now. Let me know if I missed something.

Thanks,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fallocate.2 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index ccd0431..68b33b5 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -15,6 +15,7 @@ fallocate \- manipulate file space
>  .nf
>  .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
>  .B #include <fcntl.h>
> +.B #include <linux/falloc.h>
>
>  .BI "int fallocate(int " fd ", int " mode ", off_t " offset \
>  ", off_t " len ");
> --
> 2.1.0
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
