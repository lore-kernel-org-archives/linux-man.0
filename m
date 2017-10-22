From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pthread_spin_init(3): tfix
Date: Sun, 22 Oct 2017 07:51:27 +0200
Message-ID: <f85d3a60-fb43-d8d2-e81e-b4f286d708bb@gmail.com>
References: <20171021202128.njpgppyvcjpenbos@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171021202128.njpgppyvcjpenbos-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sigh! Thanks, Branden. Applied.

Cheers,

Michael


On 10/21/2017 10:21 PM, G. Branden Robinson wrote:
> diff --git a/man3/pthread_spin_init.3 b/man3/pthread_spin_init.3
> index e6cf692d7..3018d804a 100644
> --- a/man3/pthread_spin_init.3
> +++ b/man3/pthread_spin_init.3
> @@ -30,7 +30,7 @@ pthread_spin_init, pthread_spin_destroy \- initialize or destroy a spin lock
>  .B #include <pthread.h>
>  .PP
>  .BI "int pthread_spin_init(pthread_spinlock_t *" lock " int " pshared ");"
> -.BI "int pthread_spin_destroy(pthread_spinlock_t *" cock ");"
> +.BI "int pthread_spin_destroy(pthread_spinlock_t *" lock ");"
>  .fi
>  .PP
>  Compile and link with \fI\-pthread\fP.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
