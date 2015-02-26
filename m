From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] user_namespaces.7: Fix two groff warnings for escape
 character ignored
Date: Thu, 26 Feb 2015 10:07:02 +0100
Message-ID: <54EEE236.1000500@gmail.com>
References: <1424939021-3059-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424939021-3059-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane

When do you see these warnings? (I'm not seeing them.)

Cheers,

Michael

On 02/26/2015 09:23 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/user_namespaces.7 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
> index 4baf7aa..0e24d9a 100644
> --- a/man7/user_namespaces.7
> +++ b/man7/user_namespaces.7
> @@ -439,12 +439,12 @@ maps to a range starting at 0 in the (nonexiste=
nt) parent namespace,
>  and the length of the range is the largest 32-bit unsigned integer.
>  (This deliberately leaves 4294967295 (the 32-bit signed \-1 value) u=
nmapped.
>  This is deliberate:
> -.IR "(uid_t)\ -\1"
> +.IR "(uid_t) -1"
>  is used in several interfaces (e.g.,
>  .BR setreuid (2))
>  as a way to specify "no user ID".
>  Leaving
> -.IR "(uid_t)\ -\1"
> +.IR "(uid_t) -1"
>  unmapped and unusable guarantees that there will be no
>  confusion when using these interfaces.
>  .\"
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
