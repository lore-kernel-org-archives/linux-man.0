From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] recv.2, cmsg.3: Fix type of cmsg_len member of cmsghdr
 structure
Date: Fri, 11 Mar 2016 17:33:44 +0100
Message-ID: <56E2F368.1020301@gmail.com>
References: <1457690557.5377.2.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457690557.5377.2.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikola

On 03/11/2016 11:02 AM, Nikola Forr=C3=B3 wrote:
> The type shown for cmsg_len member of cmsghdr structure is socklen_t,
> but the actual type used by glibc and the kernel is size_t.
>=20
> The information was obtained from glibc source code:
> http://bit.ly/21m1RMp

Thanks for the patch. I've applied it. However, the story is a little
more complex, because according to POSIX the type is 'socklen_t'.
So, I added some words in both pages point this out.

Cheers,

Michael

> Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/recv.2 | 6 +++---
>  man3/cmsg.3 | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/man2/recv.2 b/man2/recv.2
> index 33265b8..0491880 100644
> --- a/man2/recv.2
> +++ b/man2/recv.2
> @@ -393,9 +393,9 @@ The messages are of the form:
>  .nf
> =20
>  struct cmsghdr {
> -    socklen_t     cmsg_len;     /* data byte count, including hdr */
> -    int           cmsg_level;   /* originating protocol */
> -    int           cmsg_type;    /* protocol-specific type */
> +    size_t cmsg_len;    /* data byte count, including hdr */
> +    int    cmsg_level;  /* originating protocol */
> +    int    cmsg_type;   /* protocol-specific type */
>  /* followed by
>      unsigned char cmsg_data[]; */
>  };
> diff --git a/man3/cmsg.3 b/man3/cmsg.3
> index f1c4459..f97333f 100644
> --- a/man3/cmsg.3
> +++ b/man3/cmsg.3
> @@ -28,9 +28,9 @@ CMSG_ALIGN, CMSG_SPACE, CMSG_NXTHDR, CMSG_FIRSTHDR =
\- access ancillary data
>  .sp
>  .nf
>  struct cmsghdr {
> -    socklen_t cmsg_len;    /* data byte count, including header */
> -    int       cmsg_level;  /* originating protocol */
> -    int       cmsg_type;   /* protocol-specific type */
> +    size_t cmsg_len;    /* data byte count, including header */
> +    int    cmsg_level;  /* originating protocol */
> +    int    cmsg_type;   /* protocol-specific type */
>      /* followed by unsigned char cmsg_data[]; */
>  };
>  .fi
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
