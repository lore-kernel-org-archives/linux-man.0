From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], glob(7): Changing 8 bit characters to 7 bit representation
Date: Sat, 7 Jul 2012 08:07:08 +0200
Message-ID: <CAKgNAkhQ72FH2z-X80VxVw+0Tpw90O0fRksnKHdyHkay6SPjcQ@mail.gmail.com>
References: <20120619193915.GA823@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120619193915.GA823-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Bjarni,

On Tue, Jun 19, 2012 at 9:39 PM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: manpages
> Version: 3.41
> Severity: minor
> Tags: patch
>
>   Patch:

Thanks -- applied for 3.42.

Cheers,

Michael


> --- glob.7      2012-06-19 00:47:16.000000000 +0000
> +++ glob.7.new  2012-06-19 01:07:04.000000000 +0000
> @@ -197,9 +197,7 @@
>  element from its equivalence class, as defined for the
>  current locale.
>  For example, "\fI[[=3Da=3D]]\fP" might be equivalent
> -.\" FIXME . the accented 'a' characters are not rendering properly
> -.\" mtk May 2007
> -to "\fI[a=C2=C1=C4=D7]\fP" (warning: Latin-1 here), that is,
> +to "\fI[a\('a\(`a\(:a\(^a]\fP", that is,
>  to "\fI[a[.a-acute.][.a-grave.][.a-umlaut.][.a-circumflex.]]\fP".
>  .SH "SEE ALSO"
>  .BR sh (1),
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
