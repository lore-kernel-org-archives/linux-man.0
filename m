From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 1/2 v2] st.4: Fix description of read when block larger
 than request
Date: Wed, 8 Jun 2016 11:28:52 +0200
Message-ID: <575d541a-0812-39a7-5863-0e9ad7c51dc3@gmail.com>
References: <alpine.LSU.2.20.1606052102460.11958@xnv.znxvfnen.cevingr>
 <CAKgNAkj=5qdUpm-yheumJf6k9xytiyMdjw=HAo2OGzZNdo_yYg@mail.gmail.com>
 <alpine.LSU.2.20.1606062231470.3307@xnv.znxvfnen.cevingr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.20.1606062231470.3307-GWvddiweZZPYqp0P/RGh9g2scfS9Synj@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kai Makisara <Kai.Makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/06/2016 09:35 PM, Kai Makisara wrote:
> From: Kai M=C3=A4kisara <kai.makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
>=20
> Fix the description of read in variable block mode if the next block =
is
> larger than the requested byte count: error is returned (as already
> documented with ENOMEM; better to complete the change later than neve=
r ?-)

Thanks, Kai. Applied.

Cheers,

Michael

>=20
> Signed-off-by: Kai M=C3=A4kisara <kai.makisara-9Aww8k/80nUxHbG02/KK1g@public.gmane.org>
> ---
>  man4/st.4 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/man4/st.4 b/man4/st.4
> index f5eb3f7..5ac1ee2 100644
> --- a/man4/st.4
> +++ b/man4/st.4
> @@ -192,8 +192,7 @@ If the byte count is larger than the
>  next block on tape, the driver returns the data and the function
>  returns the actual block size.
>  If the block size is larger than the
> -byte count, the requested amount of data from the start of the block
> -is returned and the rest of the block is discarded.
> +byte count, error is returned.
>  .PP
>  In fixed-block mode the read byte counts can be arbitrary if
>  buffering is enabled, or a multiple of the tape block size if
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
