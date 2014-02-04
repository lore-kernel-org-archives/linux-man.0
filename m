From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] perf_event_open.2: cfix
Date: Tue, 04 Feb 2014 10:03:14 +0100
Message-ID: <52F0ACD2.4010005@gmail.com>
References: <1391286290-24188-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391286290-24188-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks, David.

Cheers,

Michael


On 02/01/2014 09:24 PM, David Pr=E9vot wrote:
> ---
>  man2/perf_event_open.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index eaeb9c0..3f40fad 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2052,7 +2052,7 @@ Synchronous abort (related to the reported inst=
ruction).
>  Asynchronous abort (not related to the reported instruction).
>  .TP
>  .B PERF_TXN_RETRY
> -retryable abort (retrying the transaction may have succeeded).
> +Retryable abort (retrying the transaction may have succeeded).
>  .TP
>  .B PERF_TXN_CONFLICT
>  Abort due to memory conflicts with other threads.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
