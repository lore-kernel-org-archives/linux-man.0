From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for initrd.4 (more)
Date: Sun, 29 Aug 2010 06:58:23 +0200
Message-ID: <AANLkTinZ84=23HNp5XM84w=-GtVTt=8cL1WpN0gjzvGi@mail.gmail.com>
References: <20100725162208.791257bd@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100725162208.791257bd-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

Thanks. Applied for 3.26.

Cheers,

Michael


On Sun, Jul 25, 2010 at 2:22 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man4/initrd.4 2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/initrd.4 =9A =9A =9A 2010-07-25 16:15:46.000000000 +0400
> @@ -246,7 +246,7 @@
> =9AFor more information on setting the root file system see also the
> =9A.BR LILO
> =9Aand
> -LOADLIN
> +.BR LOADLIN
> =9Adocumentation.
> =9A.PP
> =9AIt is also possible for the
> @@ -289,7 +289,7 @@
> =9Anormal root device to the NFS directory
> =9A.I /var/nfsroot
> =9Aon a local networked NFS server with IP number 193.8.232.7 for a s=
ystem with
> -IP number 193.8.232.7 and named "idefix":
> +IP number 193.8.232.2 and named "idefix":
> =9A.nf
>
> =9A =9A echo /var/nfsroot >/proc/sys/kernel/nfs-root-name
> @@ -408,7 +408,7 @@
> =9Afrom CD-ROM without the need of any floppies.
> =9AThe distribution could also use a
> =9A.B LILO
> -boot floppy and then bootstrap a bigger ram disk via
> +boot floppy and then bootstrap a bigger RAM disk via
> =9A.IR /dev/initrd
> =9Afrom the CD-ROM.
> =9A.\"
>
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
