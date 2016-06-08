From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 2/2] st.4: Update MTMKPART for kernels >= 4.6
Date: Wed, 8 Jun 2016 11:32:01 +0200
Message-ID: <566006d5-60db-173a-7e12-55232c66e01b@gmail.com>
References: <alpine.LSU.2.20.1606052111370.11958@xnv.znxvfnen.cevingr>
 <CAKgNAkiBTC5tM=3h-XrZHEdeDme_mcWp0QXxPEKahshYiqTpxg@mail.gmail.com>
 <alpine.LSU.2.20.1606062235440.3307@xnv.znxvfnen.cevingr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.20.1606062235440.3307-GWvddiweZZPYqp0P/RGh9g2scfS9Synj@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kai Makisara <Kai.Makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/06/2016 09:36 PM, Kai Makisara wrote:
> From: Kai M=C3=A4kisara <kai.makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
>=20
> Update the description of the MTMKPART operation of MTIOCTOP to match
> the changes in kernel version 4.6 (commit
> 8038e6456a3e6f5c4759e0d73c4f9165b90c93e7)

Thanks, Kai. Applied.

Cheers,

Michael

> Signed-off-by: Kai M=C3=A4kisara <kai.makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
> ---
>  man4/st.4 | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/man4/st.4 b/man4/st.4
> index 5ac1ee2..b818a1c 100644
> --- a/man4/st.4
> +++ b/man4/st.4
> @@ -22,7 +22,7 @@
>  .\" Formatted or processed versions of this manual, if unaccompanied=
 by
>  .\" the source, must acknowledge the copyright and authors of this w=
ork.
>  .\" %%%LICENSE_END
> -.TH ST 4  2016-03-15 "Linux" "Linux Programmer's Manual"
> +.TH ST 4  2016-06-05 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  st \- SCSI tape device
>  .SH SYNOPSIS
> @@ -335,11 +335,14 @@ Lock the tape drive door.
>  Format the tape into one or two partitions.
>  If
>  .I mt_count
> -is nonzero, it gives the size of the first partition and the second
> -partition contains the rest of the tape.
> -If
> +is positive, it gives the size of partition 1 and partition
> +0 contains the rest of the tape. If
>  .I mt_count
>  is zero, the tape is formatted into one partition.
> +From kernel version 4.6, negative
> +.I mt_count
> +specifies the size of partition 0 and the rest of the tape contains =
partition
> +1. The physical ordering of partitions depends on the drive.
>  This command is not allowed for a drive unless the partition support
>  is enabled for the drive (see
>  .BR MT_ST_CAN_PARTITIONS
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
