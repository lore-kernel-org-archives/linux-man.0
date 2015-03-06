From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] filesystems.5: Add cross references for ext filsystems
Date: Fri, 06 Mar 2015 14:45:21 +0100
Message-ID: <54F9AF71.6030408@gmail.com>
References: <1425643881-6581-1-git-send-email-saulery@free.fr> <1425643881-6581-6-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425643881-6581-6-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:11 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index cc43b71..2380a00 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -75,6 +75,7 @@ extended filesystem
>  .B ext2
>  offers the best performance (in terms of speed and CPU usage) of
>  the filesystems supported under Linux.
> +.RB See " ext2 " (5).
>  .TP
>  .B ext3
>  is a journaling version of the
> @@ -83,6 +84,7 @@ filesystem.
>  It is easy to
>  switch back and forth between
>  .BR ext2 " and " ext3 .
> +.RB See " ext3 " (5).
>  .TP
>  .B ext4
>  is a set of upgrades to
> @@ -90,6 +92,7 @@ is a set of upgrades to
>  including substantial performance and
>  reliability enhancements,
>  plus large increases in volume, file, and directory size limits.
> +.RB See " ext4 " (5).
>  .TP
>  .B reiserfs
>  is a journaling filesystem, designed by Hans Reiser,
> @@ -200,6 +203,9 @@ you need special programs, which can be found at
>  .UR ftp://linux01.gwdg.de\:/pub\:/ncpfs
>  .UE .
>  .SH SEE ALSO
> +.BR ext2 (5),
> +.BR ext3 (5),
> +.BR ext4 (5),
>  .BR proc (5),
>  .BR fsck (8),
>  .BR mkfs (8),
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
