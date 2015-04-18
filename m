From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fgetpwent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 Apr 2015 20:26:35 +0200
Message-ID: <5532A1DB.3030009@gmail.com>
References: <1423640516-25520-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423640516-25520-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/11/2015 08:41 AM, Ma Shimiao wrote:
> The marking matches glibc marking.

Hello Ma Shimiao,

This is just a reminder for us both that this patch is awaiting
resolution of some questions with Alexandre.

Cheers,

Michael

> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fgetpwent.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/fgetpwent.3 b/man3/fgetpwent.3
> index 3076494..3c4a57a 100644
> --- a/man3/fgetpwent.3
> +++ b/man3/fgetpwent.3
> @@ -98,6 +98,18 @@ structure.
>  .TP
>  .I /etc/passwd
>  password database file
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR fgetpwent ()
> +T}	Thread safety	MT-Unsafe race:fpwent
> +.TE
>  .SH CONFORMING TO
>  SVr4.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
