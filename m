From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 6/9] strftime.3: Expanded introduction
Date: Sun, 17 Jan 2010 18:04:19 +1300
Message-ID: <cfd18e0f1001162104k77d84679o5724debd359c69d1@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-7-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-7-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/strftime.3 | =A0 19 ++++++++++++-------
> =A01 files changed, 12 insertions(+), 7 deletions(-)

Thanks!  Applied for 3.24.

Cheers,

Michael


> diff --git a/man3/strftime.3 b/man3/strftime.3
> index bafe841..38f3afb 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -51,13 +51,18 @@ result in the character array \fIs\fP of size \fI=
max\fP.
> =A0.\" FIXME POSIX says: Local timezone information is used as though
> =A0.\" strftime() called tzset(). =A0But this doesn't appear to be th=
e case
> =A0.PP
> -Ordinary characters placed in the format string are copied to \fIs\f=
P
> -without conversion.
> -.I "Conversion specifications"
> -are introduced by a \(aq%\(aq
> -character, and terminated by a
> -.IR "conversion specifier character" ,
> -and are replaced in \fIs\fP as follows:
> +The format specification is a null-terminated string and may contain
> +special character sequences called
> +.IR "conversion specifications",
> +each of which is introduced by a \(aq%\(aq character and terminated =
by
> +some other character known as a
> +.IR "conversion specifier character".
> +All other character sequences are
> +.IR "ordinary character sequences".
> +.PP
> +The characters of ordinary character sequences (including the null b=
yte)
> +are copied verbatim from \fIformat\fP to \fIs\fP. However, the chara=
cters
> +of conversion specifications are replaced as follows:
> =A0.TP
> =A0.B %a
> =A0The abbreviated weekday name according to the current locale.
> --
> 1.6.6.102.gd6f8f
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
