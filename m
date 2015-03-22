From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] filesystems.5: Add filesystems adfs and afs
Date: Sun, 22 Mar 2015 19:17:26 +0100
Message-ID: <CAKgNAkjVZ4PJC1oqdbP6CgmNghavsOPjQfGjPGxvMaN0EDMgVQ@mail.gmail.com>
References: <1426074953-4589-1-git-send-email-saulery@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426074953-4589-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello St=C3=A9phane

On 11 March 2015 at 12:55, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrote=
:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/filesystems.5 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/man5/filesystems.5 b/man5/filesystems.5
> index 0c66f9e..b204e26 100644
> --- a/man5/filesystems.5
> +++ b/man5/filesystems.5
> @@ -52,6 +52,17 @@ Below a short description of the available or hist=
orically available
>  filesystems in Linux kernel. See kernel documentation for a comprehe=
nsive
>  description of all options and limitations.
>  .TP 10
> +.B adfs
> +is the Acorn Advanced Disc Filing System, the standard filesystem of=
 RiscOS
> +operating system which runs on Acorn's ARM-based Risc PC systems
> +and the Acorn Archimedes range of machines,

s/,/./

> +that was integrated into Linux in kernel 2.1.

s/that/This filesystem/

> +.TP
> +.B afs
> +is the distributed AFS (Andrew File System) fs. It is under developm=
ent

s/AFS (Andrew File System) fs/Andrew File System/

> +and does not yet provide the full feature set.

That last sentence is vague. What is the full feature set? Or,
otherwise, what pieces are missing?

> +It does not yet support pioctl() system call.

Or is that the only piece missing from "afs"?

Thanks,

Michael


> +.TP
>  .B ext
>  is an elaborate extension of the
>  .B minix
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
