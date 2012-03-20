From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ld.so.8: missing .TP tag before description of --audit LIST
Date: Tue, 20 Mar 2012 23:11:35 +1300
Message-ID: <CAKgNAkjJFDbfr1Q1TmJa_s52TyuSQJhNzeiFBZ+XzVP+v1tBTQ@mail.gmail.com>
References: <20120309223930.GA8520@spin>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120309223930.GA8520@spin>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?C=E9dric_Boutillier?= <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks C=E9dric. This was also reported by someone else!

On Sat, Mar 10, 2012 at 11:39 AM, C=E9dric Boutillier
<cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi!
>
> During the translation of 3.37 into French, I noticed the following
> problem: in man8/ld.so.8, there is a missing .TP tag. Patch againt
> master (man-pages-3.37-8-g2bfe665) below.
>
> Best regards,
>
> =A0 =A0 =A0 =A0C=E9dric
>
>
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 5c02204..2fbacae 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -126,6 +126,7 @@ Ignore RPATH and RUNPATH information in object na=
mes in LIST.
> =A0This option is ignored if
> =A0.B ld.so
> =A0is set-user-ID or set-group-ID.
> +.TP
> =A0.B \-\-audit LIST
> =A0Use objects named in LIST as auditors.
> =A0.SH ENVIRONMENT



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
