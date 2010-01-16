From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 2/9] stime.2, strftime.3, tzset.3, zic.8: GMT -> UTC
	(where appropriate)
Date: Sun, 17 Jan 2010 08:20:50 +1300
Message-ID: <cfd18e0f1001161120k79520278ga7d5e1c77008e6a5@mail.gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
	 <1263080737-2868-3-git-send-email-mfwitten@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-3-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael

On Sun, Jan 10, 2010 at 12:45 PM, Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/stime.2 =A0 =A0| =A0 =A02 +-
> =A0man3/strftime.3 | =A0 =A02 +-
> =A0man3/tzset.3 =A0 =A0| =A0 =A04 ++--
> =A0man8/zic.8 =A0 =A0 =A0| =A0 =A08 ++++----
> =A04 files changed, 8 insertions(+), 8 deletions(-)

Tanks. I've applied most of this. For the zic.8, I made it UTCOFF
rather than UTF_OFFSET, just to maintain the same width of text.

Cheers,

Michael


> diff --git a/man2/stime.2 b/man2/stime.2
> index 07fef5e..530d223 100644
> --- a/man2/stime.2
> +++ b/man2/stime.2
> @@ -46,7 +46,7 @@ _SVID_SOURCE
> =A0.BR stime ()
> =A0sets the system's idea of the time and date.
> =A0Time, pointed
> -to by \fIt\fP, is measured in seconds from 00:00:00 GMT January 1, 1=
970.
> +to by \fIt\fP, is measured in seconds from 00:00:00 UTC January 1, 1=
970.
> =A0.BR stime ()
> =A0may only be executed by the superuser.
> =A0.SH "RETURN VALUE"
> diff --git a/man3/strftime.3 b/man3/strftime.3
> index 8dfe58c..e356ccb 100644
> --- a/man3/strftime.3
> +++ b/man3/strftime.3
> @@ -242,7 +242,7 @@ The year as a decimal number without a century (r=
ange 00 to 99).
> =A0The year as a decimal number including the century.
> =A0.TP
> =A0.B %z
> -The time-zone as hour offset from GMT.
> +The time-zone as hour offset from UTC.
> =A0Required to emit RFC\ 822-conformant dates
> =A0(using "%a,\ %d\ %b\ %Y\ %H:%M:%S\ %z"). (GNU)
> =A0.TP
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index ad496f7..1d74405 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -67,7 +67,7 @@ environment variable.
> =A0This function is automatically called by the
> =A0other time conversion functions that depend on the timezone.
> =A0In a System-V-like environment, it will also set the variables \fI=
timezone\fP
> -(to seconds West of GMT) and \fIdaylight\fP (to 0 if this timezone d=
oes not
> +(to seconds West of UTC) and \fIdaylight\fP (to 0 if this timezone d=
oes not
> =A0have any daylight saving time rules, or to non-zero if there is a =
time during
> =A0the year when daylight saving time applies).
> =A0.PP
> @@ -223,7 +223,7 @@ It has been obsolete for many years but is requir=
ed by SUSv2.
> =A0.BI "char *timezone(" zone ", " dst )
> =A0that returned the
> =A0name of the timezone corresponding to its first argument (minutes
> -West of GMT).
> +West of UTC).
> =A0If the second argument was 0, the standard name was used,
> =A0otherwise the daylight saving time version.
> =A0.SH "SEE ALSO"
> diff --git a/man8/zic.8 b/man8/zic.8
> index 949fb62..8cb63bb 100644
> --- a/man8/zic.8
> +++ b/man8/zic.8
> @@ -260,8 +260,8 @@ A zone line has the form
> =A0.sp
> =A0.nf
> =A0.ti +.5i
> -.ta \w'Zone\0\0'u +\w'Australia/Adelaide\0\0'u +\w'GMTOFF\0\0'u +\w'=
RULES/SAVE\0\0'u +\w'FORMAT\0\0'u
> -Zone =A0 NAME =A0 =A0GMTOFF =A0RULES/SAVE =A0 =A0 =A0FORMAT =A0[UNTI=
L]
> +.ta \w'Zone\0\0'u +\w'Australia/Adelaide\0\0'u +\w'UTC_OFFSET\0\0'u =
+\w'RULES/SAVE\0\0'u +\w'FORMAT\0\0'u
> +Zone =A0 NAME =A0 =A0UTC_OFFSET =A0 =A0 =A0RULES/SAVE =A0 =A0 =A0FOR=
MAT =A0[UNTIL]
> =A0.sp
> =A0For example:
> =A0.sp
> @@ -270,13 +270,13 @@ Zone =A0 =A0 =A0Australia/Adelaide =A0 =A0 =A09=
:30 =A0 =A0Aus =A0 =A0 CST =A0 =A0 1971 Oct 31 2:00
> =A0.sp
> =A0.fi
> =A0The fields that make up a zone line are:
> -.TP "\w'GMTOFF'u"
> +.TP "\w'UTC_OFFSET'u"
> =A0.B NAME
> =A0The name of the timezone.
> =A0This is the name used in creating the time conversion information =
file for the
> =A0zone.
> =A0.TP
> -.B GMTOFF
> +.B UTC_OFFSET
> =A0The amount of time to add to UTC to get standard time in this zone=
=2E
> =A0This field has the same format as the
> =A0.B AT
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
