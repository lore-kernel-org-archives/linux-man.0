From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sysconf.3: ATTRIBUTES: Note functions that is thread-safe
Date: Wed, 29 Apr 2015 21:23:55 +0200
Message-ID: <55412FCB.6060400@gmail.com>
References: <1430302166-1700-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1430302166-1700-10-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430302166-1700-10-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/29/2015 12:09 PM, Zeng Linggang wrote:
> The marking matches glibc marking.
> The marking of functions in glibc is:
> - sysconf: MT-Safe env


Thanks, Zeng. Applied. (Again a number disagreement in the title 
of this patch; s/functions/function/)

Cheers,

Michael




> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sysconf.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/sysconf.3 b/man3/sysconf.3
> index 99a2c41..276629f 100644
> --- a/man3/sysconf.3
> +++ b/man3/sysconf.3
> @@ -324,6 +324,19 @@ is not changed.
>  In the case of options, a positive value is returned if a queried option
>  is available, and \-1 if it is not.
>  In the case of limits, \-1 means that there is no definite limit.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR sysconf ()
> +T}	Thread safety	MT-Safe env
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
