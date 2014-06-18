From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mktemp.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 18 Jun 2014 15:47:55 +0200
Message-ID: <53A1988B.1030700@gmail.com>
References: <1403070513-15363-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403070513-15363-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Haitao,

Looks good.

For now, I am going to queue these patches in a local branch, which I'll release
as we starte to make progress on the attributes(7) page and the reworking of the
existing pages to the new form.

Cheers,

Michael



On 06/18/2014 07:48 AM, Peng Haitao wrote:
> The function mktemp() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mktemp.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/mktemp.3 b/man3/mktemp.3
> index 129757e..ca661cb 100644
> --- a/man3/mktemp.3
> +++ b/man3/mktemp.3
> @@ -92,6 +92,18 @@ is set to indicate the error.
>  .TP
>  .B EINVAL
>  The last six characters of \fItemplate\fP were not XXXXXX.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR mktemp ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  POSIX.1-2008 removes the specification of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
