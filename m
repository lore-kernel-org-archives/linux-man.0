From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mbsrtowcs, mbsnrtowcs: wfix
Date: Sun, 16 Oct 2011 08:09:03 +0200
Message-ID: <CAKgNAkhee9nOi0p5B+XHRrd6hW6W4CxogO-dYLh3KhNA-7hDGA@mail.gmail.com>
References: <1318641386-24095-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318641386-24095-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Sat, Oct 15, 2011 at 3:16 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
> =A0man3/mbsnrtowcs.3 | =A0 =A02 +-
> =A0man3/mbsrtowcs.3 =A0| =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/mbsnrtowcs.3 b/man3/mbsnrtowcs.3
> index bbd1d71..9a7a5bf 100644
> --- a/man3/mbsnrtowcs.3
> +++ b/man3/mbsnrtowcs.3
> @@ -80,7 +80,7 @@ next multibyte sequence to be converted, and the nu=
mber of wide characters
> =A0written to \fIdest\fP is returned.
> =A0.IP 3.
> =A0The multibyte string has been completely converted, including the
> -terminating null wide character (\(aq\\0\(aq)
> +terminating wide character (\(aq\\0\(aq)
> =A0(which has the side effect of bringing back \fI*ps\fP to the
> =A0initial state).
> =A0In this case \fI*src\fP is set to NULL, and the number of wide
> diff --git a/man3/mbsrtowcs.3 b/man3/mbsrtowcs.3
> index fcf47ca..fc8c802 100644
> --- a/man3/mbsrtowcs.3
> +++ b/man3/mbsrtowcs.3
> @@ -51,7 +51,7 @@ multibyte sequence to be converted,
> =A0and the number of wide characters written to \fIdest\fP is returne=
d.
> =A0.IP 3.
> =A0The multibyte string has been completely converted, including the
> -terminating null wide character (\(aq\\0\(aq), which has the side
> +terminating null character (\(aq\\0\(aq), which has the side
> =A0effect of bringing back \fI*ps\fP to the
> =A0initial state.
> =A0In this case \fI*src\fP is set to NULL, and the number of wide

This is one patch where I need some helpful explanation ;-).

Your changes above seem inconsistent. In the first case, you remove
"null", and in the second, you remove "wide". I suspect the first case
is a mistake, and you meant in both cases to change "null wide" to
"null", right?

But, more generally, I think you are saying that there were some
pieces of my older e9c23bc636426366d659809bc99cd84661e86464 that
incorrectly changed "[terminating] null character" to "[terminating]
null wide character", right?

If that's the case, I suspect that there more than just those two
errors. I suspect that the first of my changes to mbstowcs.3 below was
also incorrect. Can you confirm?

Cheers,

Michael

PS See also 3c81e148a228550b4ce3d20a9c68ce0eb91cef07, which I just
pushed (to github). Do you agree with that change?


--- a/man3/mbstowcs.3
+++ b/man3/mbstowcs.3
@@ -42,9 +42,9 @@ case the number of wide characters written to \fIdest=
\fP is re
turned, but the
 shift state at this point is lost.
 .IP 3.
 The multibyte string has been completely converted, including the
-terminating \(aq\\0\(aq.
+terminating null wide character (\(aq\\0\(aq).
 In this case the number of wide characters written to
-\fIdest\fP, excluding the terminating L\(aq\\0\(aq character, is retur=
ned.
+\fIdest\fP, excluding the terminating null wide character, is returned=
=2E
 .PP
 The programmer must ensure that there is room for at least \fIn\fP wid=
e
 characters at \fIdest\fP.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
