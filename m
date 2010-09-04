From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statfs.2: Fix copy & paste error for __SWORD_TYPE definition
Date: Sat, 4 Sep 2010 06:45:50 +0200
Message-ID: <AANLkTikq8Nh=bHHTZL2bL-BbX-Z6+ftBwh_O9hS3B0rL@mail.gmail.com>
References: <20100903032531.GA16572@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100903032531.GA16572-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Guillem

On Fri, Sep 3, 2010 at 5:25 AM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wro=
te:
> The statfs structs only make use of __SWORD_TYPE, so the __UWORD_TYPE
> macro is wrong there.

Thanks. Fixed for man-pages 3.26.

Cheers,

Michael


> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> ---
> =A0man2/statfs.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/statfs.2 b/man2/statfs.2
> index ea2f085..e0e5988 100644
> --- a/man2/statfs.2
> +++ b/man2/statfs.2
> @@ -46,7 +46,7 @@ structure defined approximately as follows:
> =A0.in +4n
> =A0.nf
> =A0#if __WORDSIZE =3D=3D 32 =A0 =A0 =A0 =A0 =A0 /* System word size *=
/
> -# define __UWORD_TYPE =A0 =A0 =A0 =A0 =A0unsigned int
> +# define __SWORD_TYPE =A0 =A0 =A0 =A0 =A0int
> =A0#else /* __WORDSIZE =3D=3D 64 */
> =A0# define __SWORD_TYPE =A0 =A0 =A0 =A0 =A0long int
> =A0#endif
> --
> 1.7.1
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
