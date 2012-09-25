From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] mallopt.3, pthread_kill.3, pthread_sigmask.3,
 pthread_yield.3: ffix
Date: Tue, 25 Sep 2012 05:58:05 +0200
Message-ID: <CAKgNAkjUwkcaR+ebDiub=r7vSPOpvFsHan05mhV7SHTne8nGwg@mail.gmail.com>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org> <1348432502-26050-4-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-4-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied. Thanks!

On Sun, Sep 23, 2012 at 10:35 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
> ---
>  man3/mallopt.3         |    2 +-
>  man3/pthread_kill.3    |    2 +-
>  man3/pthread_sigmask.3 |    2 +-
>  man3/pthread_yield.3   |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/man3/mallopt.3 b/man3/mallopt.3
> index a31d8ad..e842a4f 100644
> --- a/man3/mallopt.3
> +++ b/man3/mallopt.3
> @@ -564,7 +564,7 @@ main(int argc, char *argv[])
>  .SH SEE ALSO
>  .ad l
>  .nh
> -.BR mmap (2)
> +.BR mmap (2),
>  .BR sbrk (2),
>  .BR mallinfo (3),
>  .BR malloc (3),
> diff --git a/man3/pthread_kill.3 b/man3/pthread_kill.3
> index dcbab33..68f742d 100644
> --- a/man3/pthread_kill.3
> +++ b/man3/pthread_kill.3
> @@ -71,7 +71,7 @@ the handler will be invoked in the thread
>  but if the disposition of the signal is "stop", "continue", or "term=
inate",
>  this action will affect the whole process.
>  .SH SEE ALSO
> -.BR kill (2)
> +.BR kill (2),
>  .BR sigaction (2),
>  .BR sigpending (2),
>  .BR pthread_self (3),
> diff --git a/man3/pthread_sigmask.3 b/man3/pthread_sigmask.3
> index de78dac..99f653e 100644
> --- a/man3/pthread_sigmask.3
> +++ b/man3/pthread_sigmask.3
> @@ -133,7 +133,7 @@ main(int argc, char *argv[])
>  .SH SEE ALSO
>  .BR sigaction (2),
>  .BR sigpending (2),
> -.BR sigprocmask (2)
> +.BR sigprocmask (2),
>  .BR pthread_create (3),
>  .BR pthread_kill (3),
>  .BR sigsetops (3),
> diff --git a/man3/pthread_yield.3 b/man3/pthread_yield.3
> index 40e8950..1838804 100644
> --- a/man3/pthread_yield.3
> +++ b/man3/pthread_yield.3
> @@ -58,5 +58,5 @@ On Linux, this function is implemented as a call to
>  .BR sched_yield (2).
>  .SH SEE ALSO
>  .BR sched_setscheduler (2),
> -.BR sched_yield (2)
> +.BR sched_yield (2),
>  .BR pthreads (7)
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
