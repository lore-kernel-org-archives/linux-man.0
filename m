From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Typos in man2/getrlimit.2
Date: Fri, 3 Dec 2010 06:52:19 +0100
Message-ID: <AANLkTinoHfyBS=aoWfQhugxAV3DZva0W4Vy9y0rPCvh9@mail.gmail.com>
References: <AANLkTi=XkLN+t5iFT+uretO7V=p1mZnazH++DfFm42WK@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=XkLN+t5iFT+uretO7V=p1mZnazH++DfFm42WK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Mon, Nov 29, 2010 at 9:20 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello,
>
> Here are the last bits against ea03a3a.

Thanks. Applied for 3.22.

Cheers,

Michael


>
> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index e34a152..fede0b2 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -542,7 +542,7 @@ main(int argc, char *argv[])
> =A0 =A0 =A0 =A0 exit(EXIT_FAILURE);
> =A0 =A0 }
>
> - =A0 =A0pid =3D atoi(argv[1]); =A0 =A0 =A0 =A0/* PID of traget proce=
ss */
> + =A0 =A0pid =3D atoi(argv[1]); =A0 =A0 =A0 =A0/* PID of target proce=
ss */
>
> =A0 =A0 newp =3D NULL;
> =A0 =A0 if (argc =3D=3D 4) {
> @@ -551,7 +551,7 @@ main(int argc, char *argv[])
> =A0 =A0 =A0 =A0 newp =3D &new;
> =A0 =A0 }
>
> - =A0 =A0/* Set CPU time limit of target prcess; retrieve and display
> + =A0 =A0/* Set CPU time limit of target process; retrieve and displa=
y
> =A0 =A0 =A0 =A0previous limit */
>
> =A0 =A0 if (prlimit(pid, RLIMIT_CPU, newp, &old) =3D=3D \-1)
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
