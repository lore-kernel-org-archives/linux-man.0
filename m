From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small fix for umount.2
Date: Sun, 29 Aug 2010 06:40:36 +0200
Message-ID: <AANLkTi=jiwD0o+me3oGb5H5y4YX7o6huRnJXmrkdtuy-@mail.gmail.com>
References: <20100717130534.2b2a8049@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100717130534.2b2a8049-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Yuri. Applied for 3.26.

Cheers,

Michael

On Sat, Jul 17, 2010 at 11:05 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.
> -- man-pages-git/man2/umount.2 2010-07-17 09:02:09.000000000 +0400
> +++ /tmp/umount.2 =9A =9A =9A 2010-07-17 13:04:34.000000000 +0400
> @@ -93,7 +93,7 @@
> =9ADon't dereference
> =9A.I target
> =9Aif it is a symbolic link.
> -This flag allows security problems to be avoided in in set-user-ID-\=
fIroot\fP
> +This flag allows security problems to be avoided in set-user-ID-\fIr=
oot\fP
> =9Aprograms that allow unprivileged users to unmount file systems.
> =9A.SH "RETURN VALUE"
> =9AOn success, zero is returned.
>
> --
> Best Regards,
> Yuri Kozlov
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
