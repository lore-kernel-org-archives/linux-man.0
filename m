From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages: pthread_sigmask comment / code inconsistency
Date: Sun, 16 Oct 2011 07:16:10 +0200
Message-ID: <CAKgNAkhi5svkbHUXZ1F4OEWy=CNSSwgumwOcR1ggV8fM77YA_w@mail.gmail.com>
References: <CA+Yp1NV_=VxcRvxUJYhKoGfafwqPpfS3m-hfHcQ0SzUeM1zpjQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+Yp1NV_=VxcRvxUJYhKoGfafwqPpfS3m-hfHcQ0SzUeM1zpjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pat.pannuto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Pat,

On Mon, Oct 10, 2011 at 9:53 AM, Pat Pannuto <pat.pannuto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> This is found on both my installed 3.27 and the html 3.32 release
> http://kernel.org/doc/man-pages/online/pages/man3/pthread_sigmask.3.h=
tml
>
> In the sample code, the comment indicates blocking SIGINT, while the =
code
> appears to be blocking SIGQUIT and SIGURS1. =A0This is confusing. =A0=
I believe
> removing the words "Block SIGINT; " would clarify the example.
>
> Sorry for not sending a patch, the git repo seems to still be down.
> (from here: git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git=
)
>
> Please CC on any replies, I am not on these mailing lists.
>
> -pat
>
> relevant bits:
>
> =A0/* Block SIGINT; other threads created by main() will inherit
> =A0 =A0 =A0 =A0 =A0 =A0 =A0a copy of the signal mask. */
>
> =A0 =A0 =A0 =A0 =A0 sigemptyset(&set);
> =A0 =A0 =A0 =A0 =A0 sigaddset(&set, SIGQUIT);
> =A0 =A0 =A0 =A0 =A0 sigaddset(&set, SIGUSR1);
> =A0 =A0 =A0 =A0 =A0 s =3D pthread_sigmask(SIG_BLOCK, &set, NULL);

Thanks for this report. For man-pages-3.36, I applied the patch below.

Cheers,

Michael

--- a/man3/pthread_sigmask.3
+++ b/man3/pthread_sigmask.3
@@ -110,8 +110,8 @@ main(int argc, char *argv[])
     sigset_t set;
     int s;

-    /* Block SIGINT; other threads created by main() will inherit
-       a copy of the signal mask. */
+    /* Block SIGQUIT and SIGUSR1; other threads created by main()
+       will inherit a copy of the signal mask. */

     sigemptyset(&set);
     sigaddset(&set, SIGQUIT);


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
