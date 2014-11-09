From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Document /proc/thread-self
Date: Sun, 09 Nov 2014 21:05:43 +0100
Message-ID: <545FC917.6050206@gmail.com>
References: <1414962520-5480-1-git-send-email-bernhard@bwalle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414962520-5480-1-git-send-email-bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Bernhard,

On 11/02/2014 10:08 PM, Bernhard Walle wrote:
> Add some words about /proc/thread-self that has been introduced in Li=
nux
> 3.17 with commit 0097875bd41528922fb3bb5f348c53f17e00e2fd.

Thank you for this patch, which I have applied.

MfG aus M=FCnchen,

Michael


> Signed-off-by: Bernhard Walle <bernhard-X9USDgGjgfuzQB+pC5nmwQ@public.gmane.org>
> ---
>  man5/proc.5 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/man5/proc.5 b/man5/proc.5
> index da4b5b6..e5b090d 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -4217,6 +4217,16 @@ for easy understanding.
>  .BR svipc (7)
>  provides further background on the information shown by these files.
>  .TP
> +.IR /proc/thread-self " (since Linux 3.17)"
> +This directory refers to the thread accessing the
> +.I /proc
> +filesystem,
> +and is identical to the
> +.I /proc/self/task/[tid]
> +directory named by the process thread ID
> +.RI ( [tid] )
> +of the same thread.
> +.TP
>  .IR /proc/timer_list " (since Linux 2.6.21)"
>  .\" commit 289f480af87e45f7a6de6ba9b4c061c2e259fe98
>  This read-only file exposes a list of all currently pending
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
