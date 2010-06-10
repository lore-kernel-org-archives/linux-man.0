From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] MAN: Clarify mremap.2 prototype
Date: Thu, 10 Jun 2010 06:06:16 +0200
Message-ID: <AANLkTim4NYbt66oTsxS7ECTzi63gpli6GuSOBgR2ZlR7@mail.gmail.com>
References: <20100603090818.GA4741@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100603090818.GA4741-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jun 3, 2010 at 11:08 AM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote=
:
> MAN: Clarify mremap.2 prototype
>
> mremap sometimes accepts more arguments and sometimes less.
> Clarify this in the prototype and initial description in the manpage.
>
> Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> ---
> =A0man2/mremap.2 | =A0 =A08 ++++++++
> =A01 file changed, 8 insertions(+)
>
> Index: man-pages-3.24/man2/mremap.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- man-pages-3.24.orig/man2/mremap.2
> +++ man-pages-3.24/man2/mremap.2
> @@ -39,6 +39,9 @@ mremap \- remap a virtual memory address
> =A0.sp
> =A0.BI "void *mremap(void *" old_address ", size_t " old_size ,
> =A0.BI " =A0 =A0 =A0 =A0 =A0 =A0 size_t " new_size ", int " flags );
> +.sp
> +.BI "void *mremap(void *" old_address ", size_t " old_size ,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0 size_t " new_size ", int " flags ", vo=
id *" new_address );
> =A0.fi
> =A0.SH DESCRIPTION
> =A0.BR mremap ()
> @@ -54,6 +57,11 @@ aligned.
> =A0virtual memory block.
> =A0\fInew_size\fP is the requested size of the
> =A0virtual memory block after the resize.
> +\fInew_address\fP is the new address to move the block to. Only vali=
d when
> +.I MREMAP_FIXED
> +and
> +.I MREMAP_MAYMOVE
> +are specified. The function is declared in a way that this argument =
can be omitted.
>
> =A0In Linux the memory is divided into pages.
> =A0A user process has (one or)
>

Hi Andi,

Thanks for the patch. I agree that mremap() could be improved
somewhat. But note that new_size was already described in the page. I
applied the following simpler patch.

The change will be in man-pages-3.25.

Cheers,

Michael

diff --git a/man2/mremap.2 b/man2/mremap.2
index f9d4068..c12ccb2 100644
--- a/man2/mremap.2
+++ b/man2/mremap.2
@@ -38,7 +38,7 @@ mremap \- remap a virtual memory address
 .B #include <sys/mman.h>
 .sp
 .BI "void *mremap(void *" old_address ", size_t " old_size ,
-.BI "             size_t " new_size ", int " flags );
+.BI "             size_t " new_size ", int " flags ", ...);"
 .fi
 .SH DESCRIPTION
 .BR mremap ()
@@ -54,6 +54,11 @@ aligned.
 virtual memory block.
 \fInew_size\fP is the requested size of the
 virtual memory block after the resize.
+An optional fifth argument,
+.IR new_size ,
+may be provided; see the description of
+.B MREMAP_FIXED
+below.

 In Linux the memory is divided into pages.
 A user process has (one or)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
