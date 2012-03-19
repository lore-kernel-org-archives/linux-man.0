From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getent.1: ffix
Date: Tue, 20 Mar 2012 07:37:55 +1300
Message-ID: <CAKgNAkiyNbeUE-7Y=LfB6dY_AobVJxoTSXgxOoYzvvwdvsjWnA@mail.gmail.com>
References: <1331330821-25895-1-git-send-email-taffit@debian.org> <4F5AC682.5080708@tilapin.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F5AC682.5080708-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Sat, Mar 10, 2012 at 4:12 PM, David Pr=E9vot <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org> wro=
te:
> Hi Michael,
>
> Just spotted this one too while reviewing the translation: as the
> previous one, the purpose is to comply with man(1) conventions.

I've applied both patches for man-pages-3.38.

Cheers,

Michael


> Regards
>
> David
>
> diff --git a/man1/getent.1 b/man1/getent.1
> index 8caf8aa..1b3f3de 100644
> --- a/man1/getent.1
> +++ b/man1/getent.1
> @@ -28,7 +28,7 @@ getent \- get entries from Name Service Switch libr=
aries
> =A0.IR database " [" key " ...]"
> =A0.SH DESCRIPTION
> =A0The
> -.I getent
> +.B getent
> =A0command displays entries from databases supported by the
> =A0Name Service Switch libraries,
> =A0which are configured in



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
