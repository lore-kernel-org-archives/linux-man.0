From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] st4: Remove spurious copyright section
Date: Thu, 11 Feb 2016 13:21:11 +0100
Message-ID: <56BC7CB7.4040601@gmail.com>
References: <56BA4329.4040402@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BA4329.4040402-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tobias,

> there seems to be a leftover copyright section in st.4.

Thanks for the patch! Applied.

By the way, inline patches make my life rather easier. Could 
you do that for future patches?

Thanks,

Michael


> ---
>  man4/st.4 | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/man4/st.4 b/man4/st.4
> index f44310b..13e7f8e 100644
> --- a/man4/st.4
> +++ b/man4/st.4
> @@ -941,16 +941,6 @@ kernel.
>  The solution is to tell the software to use larger transfers (often
>  telling it to use larger blocks).
>  If this is not possible, direct transfers can be disabled.
> -.\" .SH COPYRIGHT
> -.\" Copyright \(co 1995 Robert K. Nichols.
> -.\" .br
> -.\" Copyright \(co 1999-2005 Kai M\(:akisara.
> -.\" .PP
> -.\" %%%LICENSE_START(VERBATIM)
> -.\" Permission is granted to make and distribute verbatim copies of this
> -.\" manual provided the copyright notice and this permission notice are
> -.\" preserved on all copies.
> -.\" Additional permissions are contained in the header of the source file.
>  .SH SEE ALSO
>  .BR mt (1)
>  .PP


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
