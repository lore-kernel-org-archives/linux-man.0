From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getfsent.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Wed, 25 Jun 2014 11:10:58 +0200
Message-ID: <53AA9222.6020701@gmail.com>
References: <1403665926-11682-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403665926-11682-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied (in my local branch).

Cheers,

Michael


On 06/25/2014 05:12 AM, Peng Haitao wrote:
> The functions setfsent(), getfsent(), endfsent(), getfsspec()
> and getfsfile() are not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getfsent.3 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/man3/getfsent.3 b/man3/getfsent.3
> index 022895a..12c883a 100644
> --- a/man3/getfsent.3
> +++ b/man3/getfsent.3
> @@ -112,6 +112,22 @@ Upon failure or end-of-file, these functions return NULL and 0, respectively.
>  .\" The
>  .\" .BR getfsent ()
>  .\" function appeared in 4.0BSD; the other four functions appeared in 4.3BSD.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw35 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR setfsent (),
> +.BR getfsent (),
> +.BR endfsent (),
> +.BR getfsspec (),
> +.BR getfsfile ()
> +T}	Thread safety	MT-Unsafe
> +.TE
>  .SH CONFORMING TO
>  These functions are not in POSIX.1-2001.
>  Several operating systems have them, for example,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
