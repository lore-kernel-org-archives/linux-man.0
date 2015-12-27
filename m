From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fnmatch.3: Describe the FNM_EXTMATCH flag and pattern
 syntax
Date: Sun, 27 Dec 2015 17:15:35 +0100
Message-ID: <56800EA7.8000504@gmail.com>
References: <1444899508-24394-1-git-send-email-P@draigBrady.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444899508-24394-1-git-send-email-P-V8g9lnOeT5ydJdNcDFJN0w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?P=c3=a1draig_Brady?= <P@draigBrady.com>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/15/2015 10:58 AM, P=C3=A1draig Brady wrote:
> Signed-off-by: P=C3=A1draig Brady <P@draigBrady.com>

Thanks, P=C3=A1draig. APplied.

Cheers,

Michael


> ---
>  man3/fnmatch.3 | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/man3/fnmatch.3 b/man3/fnmatch.3
> index a7c55ff..3502e06 100644
> --- a/man3/fnmatch.3
> +++ b/man3/fnmatch.3
> @@ -86,6 +86,32 @@ use of glibc and is implemented only in certain ca=
ses.
>  .B FNM_CASEFOLD
>  If this flag (a GNU extension) is set, the pattern is matched
>  case-insensitively.
> +.TP
> +.B FNM_EXTMATCH
> +If this flag (a GNU extension) is set, extended patterns are
> +supported, as introduced by \&'ksh' and now supported by other shell=
s.
> +The extended format is as follows, with \fIpattern\-list\fR
> +being a \&'|' separated list of patterns.
> +.TP
> +\&'?(\fIpattern\-list\fR)'
> +The pattern matches if zero or one occurrences of any of the
> +patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
> +.TP
> +\&'*(\fIpattern\-list\fR)'
> +The pattern matches if zero or more occurrences of any of the
> +patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
> +.TP
> +\&'+(\fIpattern\-list\fR)'
> +The pattern matches if one or more occurrences of any of the
> +patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
> +.TP
> +\&'@(\fIpattern\-list\fR)'
> +The pattern matches if exactly one occurrence of any of the
> +patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
> +.TP
> +\&'!(\fIpattern\-list\fR)'
> +The pattern matches if the input \fIstring\fR cannot be matched with
> +any of the patterns in the \fIpattern\-list\fR.
>  .SH RETURN VALUE
>  Zero if
>  .I string
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
