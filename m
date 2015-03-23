From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hier.7: document /initrd, /lost+found and /sys
Date: Mon, 23 Mar 2015 07:03:40 +0100
Message-ID: <550FACBC.9090905@gmail.com>
References: <CAKgNAkho0SiSMXNNEA=2OzhYMnVzFeH_CyPVehaRNoNMYV08ug@mail.gmail.com> <1427056668-4715-2-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427056668-4715-2-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/22/2015 09:37 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane.

Applied.

Cheers,

Michael


> Ubuntu Bug #70094 reported by Brian Beck
>=20
> https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/70094
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/hier.7 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/man7/hier.7 b/man7/hier.7
> index 77f365c..615ad65 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -51,6 +51,10 @@ and configuration files should go to
>  .I /sbin
>  and
>  .IR /etc .
> +The operating system kernel (initrd for example) must be located in =
either
> +.I /
> +or
> +.IR /boot .
>  .TP
>  .I /dev
>  Special or device files, which refer to physical devices.
> @@ -107,6 +111,11 @@ libraries (optional).
>  .I /lib/modules
>  Loadable kernel modules (optional).
>  .TP
> +.I /lost+found
> +This directory contains items lost in the filesystem.
> +These items are usually chunks of files mangled as a consequence of
> +a faulty disk or a system crash.
> +.TP
>  .I /media
>  This directory contains mount points for removable media such as CD
>  and DVD disks or USB sticks.
> @@ -161,6 +170,12 @@ usually not executed by normal users.
>  .I /srv
>  This directory contains site-specific data that is served by this sy=
stem.
>  .TP
> +.I /sys
> +This is a mount point for the sysfs filesystem, which provides infor=
mation
> +about the kernel like
> +.IR /proc ,
> +but better structured, following the formalism of kobject infrastruc=
ture.
> +.TP
>  .I /tmp
>  This directory contains temporary files which may be deleted with no
>  notice, such as by a regular job or at system boot up.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
