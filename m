From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages bug report: gettid(2)
Date: Sat, 13 Feb 2016 15:58:44 +0100
Message-ID: <56BF44A4.9030106@gmail.com>
References: <1455350558.1727.3.camel@intelfx.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455350558.1727.3.camel-Imz0WJRl3c7a5EbDDlwbIw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: intelfx-Imz0WJRl3c7a5EbDDlwbIw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/13/2016 09:02 AM, Ivan Shapovalov wrote:
> Hello,
> 
> the man page gettid(2) (as in
> http://man7.org/linux/man-pages/man2/gettid.2.html), as well as in
> release 4.04, in section "NOTES" says
> 
> -its thread group ID (the value returned by gettid(2))
> 
> which probably should be
> 
> +its thread group ID (the value returned by getpid(2))

Thanks, Ivan. Fixed!

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
