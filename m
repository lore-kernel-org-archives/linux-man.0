From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 23 May 2013 13:12:13 +0200
Message-ID: <519DF98D.2@gmail.com>
References: <1369298684-892-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369298684-892-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/23/13 10:44, Peng Haitao wrote:
> The function getlogin() is not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getlogin.3 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man3/getlogin.3 b/man3/getlogin.3
> index be7cc87..4a2a3e9 100644
> --- a/man3/getlogin.3
> +++ b/man3/getlogin.3
> @@ -135,6 +135,19 @@ password database file
>  \fI/var/run/utmp\fP
>  (traditionally \fI/etc/utmp\fP;
>  some libc versions used \fI/var/adm/utmp\fP)
> +.SH ATTRIBUTES
> +.SS Multithreading(see pthreads(7))
> +The
> +.BR getlogin ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR getlogin_r ()
> +function is thread-safe.
> +.LP
> +The
> +.BR cuserid ()
> +function is thread-safe with exceptions.

Peng,

I think it would be good to describe the exceptions here. Okay?
Could you adjust and resent.

Thanks,

Michael


>  .SH CONFORMING TO
>  .BR getlogin ()
>  and
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
