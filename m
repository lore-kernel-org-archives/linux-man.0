From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Patch] Fix the prototype of personality(2)
Date: Mon, 10 Mar 2008 08:21:32 +0100
Message-ID: <cfd18e0f0803100021u3d28db41pcdf2c0b64aabeada@mail.gmail.com>
References: <20080308.200447.90797012.xiyou.wangcong@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080308.200447.90797012.xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Cong,

On Sat, Mar 8, 2008 at 1:04 PM, WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>  According to the source code of Linux kernel, the type of the
>  return value of personality(2) should be long instead of int.

But in <sys/personality.h>, the return type is long...  So it seems to
me the page is correct.  Let me know if/why you still disagree.

Cheers,

Michael


>  Signed-off-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
>  ---
>
>  Index: man-pages-2.78/man2/personality.2
>  ===================================================================
>  --- man-pages-2.78.orig/man2/personality.2
>  +++ man-pages-2.78/man2/personality.2
>  @@ -33,7 +33,7 @@ personality \- set the process execution
>   .SH SYNOPSIS
>   .B #include <sys/personality.h>
>   .sp
>  -.BI "int personality(unsigned long " persona );
>  +.BI "long personality(unsigned long " persona );
>   .SH DESCRIPTION
>   Linux supports different execution domains, or personalities, for each
>   process.
>



-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
