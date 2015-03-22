From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ioctl_list.2: srcfix
Date: Sun, 22 Mar 2015 19:53:15 +0100
Message-ID: <550F0F9B.70408@gmail.com>
References: <1426385789-12406-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426385789-12406-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 03:16 AM, St=C3=A9phane Aulery wrote:
> Fix a warning of groff: line 527: warning [p 6, 2.3i]: cannot adjust =
line

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael

> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man2/ioctl_list.2 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
> index 00f6c4b..994e0f4 100644
> --- a/man2/ioctl_list.2
> +++ b/man2/ioctl_list.2
> @@ -525,9 +525,9 @@ l l l l.
>  // <include/linux/scsi.h>
>  .TS
>  l l l.
> -0x00005382	SCSI_IOCTL_GET_IDLUN	struct { int [2]; } *
> -0x00005383	SCSI_IOCTL_TAGGED_ENABLE	void
> -0x00005384	SCSI_IOCTL_TAGGED_DISABLE	void
> +0x00005382	SCSI_IOCTL_GET_IDLUN       struct { int [2]; } *
> +0x00005383	SCSI_IOCTL_TAGGED_ENABLE   void
> +0x00005384	SCSI_IOCTL_TAGGED_DISABLE  void
>  .TE
>  .TS
>  l l l l.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
