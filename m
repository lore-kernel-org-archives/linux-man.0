From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages-3.81.Announce: Replace words "and protocols" by "and
 configuration"
Date: Tue, 03 Mar 2015 09:39:56 +0100
Message-ID: <54F5735C.6030702@gmail.com>
References: <1425329372-11176-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425329372-11176-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/02/2015 09:49 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> There are no protocol descriptions in Section 5. Protocols are in Sec=
tion 7.
>=20
> See commit 12618ce888aaa8d9d70f586b61b8d532d42fbd4a
>=20
> There are configuration descriptions in Section 5.
>=20
> See commit db6642bdb2aa29b356ea61857623bc72793c3870
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man-pages-3.81.Announce | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/man-pages-3.81.Announce b/man-pages-3.81.Announce
> index d21357a..56d9a70 100644
> --- a/man-pages-3.81.Announce
> +++ b/man-pages-3.81.Announce
> @@ -31,7 +31,7 @@ Here is a breakdown of what this distribution conta=
ins:
>      Section 2 =3D system calls
>      Section 3 =3D libc calls
>      Section 4 =3D devices (e.g., hd, sd)
> -    Section 5 =3D file formats and protocols (e.g., wtmp, /etc/passw=
d, nfs)
> +    Section 5 =3D file formats and configuration (e.g., wtmp, /etc/p=
asswd)

Hi St=C3=A9phane,

Thanks for the proposal. I instead just made the description=20
"file formats".

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
