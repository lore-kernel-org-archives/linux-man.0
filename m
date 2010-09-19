From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] random.3: Update initstate() return value description to
 match glibc
Date: Sun, 19 Sep 2010 16:09:04 +0200
Message-ID: <AANLkTi=zFZX2r5rn4ARhRQ0us_LapEs0jtxeGdPiUAe1@mail.gmail.com>
References: <20100916164415.GA5137@thialfi>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100916164415.GA5137@thialfi>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "W. Trevor King" <wking-lbwBIqCsw6A3uPMLIKxrzw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Trevor,

On Thu, Sep 16, 2010 at 6:44 PM, W. Trevor King <wking-lbwBIqCsw6A3uPMLIKxrzw@public.gmane.org> wrot=
e:
> The glibc manual section on initstate
> =A0http://www.gnu.org/software/libc/manual/html_node/BSD-Random.html#=
index-initstate-2292
> makes no mention of NULL on error (which it does mention for setstate=
).
>
> As proof, the test code
>
> =A0#include <stdlib.h>
> =A0#include <stdio.h>
> =A0#include <errno.h>
>
> =A0int main(int argc, char **argv)
> =A0{
> =A0 =A0void *state =3D NULL;
> =A0 =A0int arg_state =3D 0;
>
> =A0 =A0printf("errno before %d\n", errno);
> =A0 =A0state =3D (void *) initstate(1, (void *) &arg_state, 7);
> =A0 =A0printf("errno after %d (EINVAL is %d)\n", errno, EINVAL);
> =A0 =A0printf("state returned from bad initstate call: %p\n", state);
>
> =A0 =A0return 0;
> =A0}
>
> returns
>
> =A0errno before 0
> =A0errno after 22 (EINVAL is 22)
> =A0state returned from bad initstate call: 0xb781f040
>
> not
>
> =A0errno before 0
> =A0errno after 22 (EINVAL is 22)
> =A0state returned from bad initstate call: (nil)
>
> This makes sense because glibc's stdlib/random.c defines __initstate(=
)
> to always return ostate (blank lines removed):
>
> =A0char *
> =A0__initstate (seed, arg_state, n)
> =A0 =A0 =A0 unsigned int seed;
> =A0 =A0 =A0 char *arg_state;
> =A0 =A0 =A0 size_t n;
> =A0{
> =A0 =A0int32_t *ostate;
> =A0 =A0__libc_lock_lock (lock);
> =A0 =A0ostate =3D &unsafe_state.state[-1];
> =A0 =A0__initstate_r (seed, arg_state, n, &unsafe_state);
> =A0 =A0__libc_lock_unlock (lock);
> =A0 =A0return (char *) ostate;
> =A0}
>
> Personally, I think the behavior specified by the old man page makes
> more sense, but I don't imagine the glibc folks want to change their
> version.
>
> This patch it against the current Git version of man-pages, and was
> generated with 'git format-patch -1' before I altered it to include
> the extra information the man-pages project suggested:
> =A0http://www.kernel.org/doc/man-pages/patches.html
>
> W. Trevor King

Thanks for the detailed report. I applied the patch for man-pages-3.27.

Thanks,

Michael


> ---
> =A0man3/random.3 | =A0 =A05 +++--
> =A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/man3/random.3 b/man3/random.3
> index 7568dc1..6845b98 100644
> --- a/man3/random.3
> +++ b/man3/random.3
> @@ -120,9 +120,10 @@ The
> =A0function returns no value.
> =A0The
> =A0.BR initstate ()
> -and
> +function returns a pointer to the previous state.
> +The
> =A0.BR setstate ()
> -functions return a pointer to the previous state
> +function returns a pointer to the previous state
> =A0array, or NULL on error.
> =A0.SH ERRORS
> =A0.TP
> --
> 1.7.2.2.173.g515cc
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
