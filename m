From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] elf.5: missing .TP tag
Date: Sat, 24 Mar 2012 11:52:18 +1300
Message-ID: <CAKgNAkjQJpG3BiqfOAcCVOghaCdmyfJWO0OuUps9feoiOaacoQ@mail.gmail.com>
References: <4f6b71e2.6821440a.7919.4655@mx.google.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4f6b71e2.6821440a.7919.4655-ATjtLOhZ0NVl57MIdRCFDg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 23, 2012 at 7:35 AM, Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> Hello,
>
> I just subscribed this mailing list.
>
> During the translation into Japanese,
> nI noticed a missing a missing .TP tag before PT_GNU_STACK
> in man5/elf.5. Patch against 3.37 release below.

Thanks, Akihiro! Applied for 3.38.

Cheers,

Michael


> diff --git a/man5/elf.5 b/man5/elf.5
> index 2862740..b0ccb30 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -793,6 +793,7 @@ are reserved for processor-specific semantics.
> =A0Values less than or equal to
> =A0.BR PT_LOPROC
> =A0are reserved for processor-specific semantics.
> +.TP
> =A0.BR PT_GNU_STACK
> =A0GNU extension which is used by the Linux kernel to control the sta=
te of the
> =A0stack via the flags set in the
>
> --
> Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
