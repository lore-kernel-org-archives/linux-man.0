From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_setname_np.3: The thread variable is passed in by value
Date: Tue, 2 Apr 2013 09:13:55 +0200
Message-ID: <CAKgNAkgu7EaKKBRiRV8VXpuD3hLkSvcstOLKzfhXrMc4X1GA-g@mail.gmail.com>
References: <1364844797-19846-1-git-send-email-andrew@digital-domain.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364844797-19846-1-git-send-email-andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 1, 2013 at 9:33 PM, Andrew Clayton
<andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org> wrote:
> i.e
>
>     pthread_t thread;
>
>     pthread_setname_np(thread, ...);
>
> and not
>
>    pthread_setname_np(&thread, ...);
>
> Signed-off-by: Andrew Clayton <andrew-gyMb1R/nBgN3uBD2Ct+Y/qxOck334EZe@public.gmane.org>

Thanks Andrew. Applied.

Cheers,

Michael


> ---
>  man3/pthread_setname_np.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man3/pthread_setname_np.3 b/man3/pthread_setname_np.3
> index b6b4563..3dca000 100644
> --- a/man3/pthread_setname_np.3
> +++ b/man3/pthread_setname_np.3
> @@ -30,8 +30,8 @@ pthread_setname_np, pthread_getname_np \- set/get the name of a thread
>  .nf
>  .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
>  .B #include <pthread.h>
> -.BI "int pthread_setname_np(pthread_t *" thread ", const char *" name ");
> -.BI "int pthread_getname_np(pthread_t *" thread ,
> +.BI "int pthread_setname_np(pthread_t " thread ", const char *" name ");
> +.BI "int pthread_getname_np(pthread_t " thread ,
>  .BI "                       const char *" name ", size_t " len );
>  .fi
>  .sp
> --
> 1.8.1.4
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
