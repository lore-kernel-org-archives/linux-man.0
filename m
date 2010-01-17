From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 5/9] strftime.3: Move 822-compliant date format example to
	EXAMPLES section
Date: Sun, 17 Jan 2010 18:33:27 +1300
Message-ID: <cfd18e0f1001162133lfc698a6we05c64a4cd25c1a6@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-6-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-6-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> The RFC 822-compliant date format given in the description of `%z'
> is now moved to the `EXAMPLES' section (note: `EXAMPLE' has been
> renamed `EXAMPLES').
>
> Furthermore, that format example is now actually RFC 822-compliant
> (using `%y' instead of `%Y') and has been qualified as being correct
> only when in the context of at least an English locale. Also, `%T'
> is used in place of `%H:%M:%S'.
>
> For completeness, an RFC 2822-compliant format example has been
> similarly added.
>
> The formatting of the EXAMPLES section has been improved.

I've applied a slightly modified version of this patch (I reformatted
the pieces to do with the example program differently from what you
suggested).

Thanks!

Michael


> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/strftime.3 | =A0 30 +++++++++++++++++++++++-------
> =A01 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index 0d925fa..bafe841 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -242,9 +242,7 @@ The year as a decimal number without a century (r=
ange 00 to 99).
> =A0The year as a decimal number including the century.
> =A0.TP
> =A0.B %z
> -The +hhmm or -hhmm numeric time zone (that is, the hour and minute o=
ffset from UTC).
> -Required to emit RFC\ 822-conformant dates
> -(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (SU)
> +The +hhmm or -hhmm numeric time zone (that is, the hour and minute o=
ffset from UTC). (SU)
> =A0.TP
> =A0.B %Z
> =A0The timezone or name or abbreviation.
> @@ -441,14 +439,30 @@ Nowadays,
> =A0.BR gcc (1)
> =A0provides the \fI\-Wno\-format\-y2k\fP option to prevent the warnin=
g,
> =A0so that the above workaround is no longer required.
> -.SH EXAMPLE
> +.SH EXAMPLES
> +.BR "RFC\ 2822-compliant date format"
> +(with an English locale for %a and %b)
> +.PP
> +.in +2n
> +"%a,\ %d\ %b\ %Y\ %T\ %z"
> +.PP
> +.BR "RFC\ 822-compliant date format"
> +(with an English locale for %a and %b)
> +.PP
> +.in +2n
> +"%a,\ %d\ %b\ %y\ %T\ %z"
> +.PP
> +.BR "Sample program"
> +.PP
> +.in +2n
> =A0The program below can be used to experiment with
> =A0.BR strftime ().
> =A0.PP
> +.in +2n
> =A0Some examples of the result string produced by the glibc implement=
ation of
> =A0.BR strftime ()
> =A0are as follows:
> -.in +4n
> +.in +2n
> =A0.nf
>
> =A0.RB "$" " ./a.out \(aq%m\(aq"
> @@ -457,9 +471,11 @@ Result string is "11"
> =A0Result string is "00011"
> =A0.RB "$" " ./a.out \(aq%_5m\(aq"
> =A0Result string is " =A0 11"
> +
> =A0.fi
> -.in
> -.SS Program source
> +.in -2n
> +Here is the program source:
> +.in +2n
> =A0\&
> =A0.nf
> =A0#include <time.h>
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
