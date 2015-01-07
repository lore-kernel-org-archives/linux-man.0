From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_timedjoin_np.3: Document case where it return
 EINVAL
Date: Wed, 07 Jan 2015 12:31:28 +0100
Message-ID: <54AD1910.7050708@gmail.com>
References: <1346157420-22571-1-git-send-email-jezz@sysmic.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346157420-22571-1-git-send-email-jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/28/2012 02:37 PM, J=C3=A9r=C3=B4me Pouiller wrote:
> From: Jerome Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>

Thanks, J=C3=A9r=C3=B4me. Applied (very long after the fact).

Cheers,

Michael

> Signed-off-by: J=C3=A9r=C3=B4me Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
> ---
>  man3/pthread_tryjoin_np.3 |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/man3/pthread_tryjoin_np.3 b/man3/pthread_tryjoin_np.3
> index ba1cd41..03de5dd 100644
> --- a/man3/pthread_tryjoin_np.3
> +++ b/man3/pthread_tryjoin_np.3
> @@ -101,6 +101,10 @@ can in addition fail with the following error:
>  The call timed out before
>  .I thread
>  terminated.
> +.TP
> +.BR EINVAL
> +.I abstime
> +value is invalid.
>  .PP
>  .BR pthread_timedjoin_np ()
>  never returns the error
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
