From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/9] tzset.3: Cleanup grammar/clarity
Date: Sun, 17 Jan 2010 08:08:11 +1300
Message-ID: <cfd18e0f1001161108x49159c24se2c19120cbd80560@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-2-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-2-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> * A comma is added at the end of an introductory phrase.
>
> * The preposition `to' is used to complete the idea of
> =A0setting a variable's value.
>
> * The conjunction `or' is introduced to separate alternative
> =A0values for `daylight'.


Thanks. Applied for 3.24!

Cheers,

Michael


> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man3/tzset.3 | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 10c6d3a..ad496f7 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -66,9 +66,9 @@ function initializes the \fItzname\fP variable from=
 the
> =A0environment variable.
> =A0This function is automatically called by the
> =A0other time conversion functions that depend on the timezone.
> -In a System-V-like environment it will also set the variables \fItim=
ezone\fP
> -(seconds West of GMT) and \fIdaylight\fP (0 if this timezone does no=
t
> -have any daylight saving time rules, non-zero if there is a time dur=
ing
> +In a System-V-like environment, it will also set the variables \fIti=
mezone\fP
> +(to seconds West of GMT) and \fIdaylight\fP (to 0 if this timezone d=
oes not
> +have any daylight saving time rules, or to non-zero if there is a ti=
me during
> =A0the year when daylight saving time applies).
> =A0.PP
> =A0If the
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
