From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] armscii-8.7: Capitalize ARMSCII (Was: [patch]
 armscii-8.7: Capitalize hexadecimal numbers)
Date: Mon, 25 Oct 2010 06:51:20 +0200
Message-ID: <AANLkTin7bTinvG7VsV-qxVZ6qY_XV70xdQJFQKDjV5Va@mail.gmail.com>
References: <ia1s60$sqs$1@dough.gmane.org> <ia20s8$jts$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ia20s8$jts$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Sun, Oct 24, 2010 at 9:19 PM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wro=
te:
> Hi,
>
> Le 24/10/2010 13:59, David Pr=E9vot a =E9crit :
>
>> The inline patch (and the gzipped one
>> attached, hopefully not messing with encoding) address this
>> minor issue for armscii-8.7 [...]
>
> This inline patch also propose to keep ARMSCII capitalize (as it
> is already written in two other places of these documents). One
> could also prefer to use =93ArmSCII=94 instead (which should be the
> correct way to write it, even if =93ARMSCII=93 is accepted).
>
> The second patch (at your choice), propose the use of =93ArmSCII=94.

I applied the second patch for 3.30.

thanks,

Michael


> diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
> index a8ee929..b5319af 100644
> --- a/man7/armscii-8.7
> +++ b/man7/armscii-8.7
> @@ -36,7 +36,7 @@ are printable and unlisted in the
> =A0.BR ascii (7)
> =A0manual page.
> =A0The fourth column will only show the proper glyphs
> -in an environment configured for armscii-8.
> +in an environment configured for ARMSCII-8.
> =A0.TS
> =A0l l l c lp-1.
> =A0Oct =A0 =A0Dec =A0 =A0 Hex =A0 =A0 Char =A0 =A0Description
>
>
> diff --git a/man7/armscii-8.7 b/man7/armscii-8.7
> index a8ee929..9cd8bd1 100644
> --- a/man7/armscii-8.7
> +++ b/man7/armscii-8.7
> @@ -30,13 +30,13 @@ hexadecimal
> =A0.SH DESCRIPTION
> =A0The Armenian Standard Code for Information Interchange,
> =A08-bit coded character set.
> -.SS "ARMSCII-8 Characters"
> -The following table displays the characters in ARMSCII-8, which
> +.SS "ArmSCII-8 Characters"
> +The following table displays the characters in ArmSCII-8, which
> =A0are printable and unlisted in the
> =A0.BR ascii (7)
> =A0manual page.
> =A0The fourth column will only show the proper glyphs
> -in an environment configured for armscii-8.
> +in an environment configured for ArmSCII-8.
> =A0.TS
> =A0l l l c lp-1.
> =A0Oct =A0 =A0Dec =A0 =A0 Hex =A0 =A0 Char =A0 =A0Description
>
>
> Regards
>
> David
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
