From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for kexec_load.2
Date: Sun, 7 Nov 2010 16:07:22 +0100
Message-ID: <AANLkTimhnQ13SrAceUhG4AaeMKAPXj+MJYDyHSXFhVdB@mail.gmail.com>
References: <20101106113809.49422a9b@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101106113809.49422a9b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Yuri,

On Sat, Nov 6, 2010 at 9:38 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.
>
> --- man-pages-git/man2/kexec_load.2 =9A =9A 2010-11-02 13:41:53.00000=
0000 +0300
> +++ /tmp/kexec_load.2 =9A 2010-11-06 11:36:45.000000000 +0300
> @@ -121,8 +121,9 @@
> =9A.TP
> =9A.B EINVAL
> =9A.I flags
> -is invalid; of
> -.IR nr_segments is too large
> +is invalid; or
> +.IR nr_segments
> +is too large.
> =9A.\" KEXEC_SEGMENT_MAX =3D=3D 16
> =9A.TP
> =9A.B EPERM

Someone else already reported this, and iy's fixed.

thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
