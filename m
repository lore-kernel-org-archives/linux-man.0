From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hier.7: document /initrd, /lost+found and /sys
Date: Sun, 22 Mar 2015 19:49:10 +0100
Message-ID: <CAKgNAkho0SiSMXNNEA=2OzhYMnVzFeH_CyPVehaRNoNMYV08ug@mail.gmail.com>
References: <1426423613-4307-1-git-send-email-saulery@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426423613-4307-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane,

On 15 March 2015 at 13:46, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrote=
:
> Ubuntu Bug #70094 reported by Brian Beck
>
> https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/70094
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/hier.7 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/man7/hier.7 b/man7/hier.7
> index 77f365c..f28b384 100644
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
> +This directory contains items lost on file system.

"filesystem" -- no space.

s/on/in the/

> +These items are usually chunks of files
> +mangled by a slowly rotting disk.

=3D=3D> mangled as a consequence of a faulty disk or a system crash.
?

> +.TP
>  .I /media
>  This directory contains mount points for removable media such as CD
>  and DVD disks or USB sticks.
> @@ -161,6 +170,14 @@ usually not executed by normal users.
>  .I /srv
>  This directory contains site-specific data that is served by this sy=
stem.
>  .TP
> +.I /sys
> +This is a mount point for the sysfr filesystem, which provides infor=
mation

s/sysfr/sysfs/ I think.

> +about the kernel.
> +It was created to replace
> +.I /proc
> +and provide more structured information.

That's not accurate, I think. /proc isn't going away any time soon.

> +Any new information on the kernel is added to this file system.

I think that last sentence can be dropped.

Cheers,

Michael

> +.TP
>  .I /tmp
>  This directory contains temporary files which may be deleted with no
>  notice, such as by a regular job or at system boot up.
> --
> 2.1.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
