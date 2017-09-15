From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and
 pthread_mutex_consistent()
Date: Fri, 15 Sep 2017 09:53:41 +0200
Message-ID: <31afda7b-cc49-7c8f-c6d4-79b4d4daab1c@gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com>
 <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
 <20170826210528.GA32472@HP.internal.baidu.com>
 <1159fa2e-006e-d3dd-7d1b-0e055cad42b5@gmail.com>
 <20170915094414.GA18043@HP.internal.baidu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915094414.GA18043-BUpDV9vzqx74NUO8LpiZZi+1pv2Z1Xu3@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/15/2017 11:45 AM, Yubin Ruan wrote:
> On Wed, Sep 13, 2017 at 05:00:11PM +0200, Michael Kerrisk (man-opages) wrote:
>> Hi Yubin
>>
>>> Hi Michael,
>>>
>>> Sorry that it took so long.
>>>
>>> Following is the renew patch. I have corrected several formatting issues (i.e.,
>>> \n , - , but I can't find anything wrong with ' ) and some typos. The only
>>> issue I cannot solve is that the new `pthread_mutex_consistent(3)` page is too
>>> short that it shows at the very bottom... please help with this.
>>>
>>> Also, please find attached three verification snippets.
>>
>> I've done some heavy editing, and added quite a few pieces to these pages,
>> and pushed the results to Git. Go take a look and let me know
>> of anything you think needs fixing. Thanks for these pages!
> 
> Good job. No objection, except a minor change and some code formatting change.
> See the diff below.

Thanks, Yubin. Applied.

Cheers,

Michael

> diff --git a/man3/pthread_mutexattr_setrobust.3 b/man3/pthread_mutexattr_setrobust.3
> index e9e8e76..66b4bed 100644
> --- a/man3/pthread_mutexattr_setrobust.3
> +++ b/man3/pthread_mutexattr_setrobust.3
> @@ -86,7 +86,7 @@ on the mutex will block indefinitely.
>  .TP
>  .B PTHREAD_MUTEX_ROBUST
>  If a mutex is initialized with the
> -.BR PTHREAD_MUTEX_ROBUST ,
> +.BR PTHREAD_MUTEX_ROBUST
>  attribute and its owner dies without unlocking it,
>  any future attempts to call
>  .BR pthread_mutex_lock (3)
> @@ -255,22 +255,21 @@ main(int argc, char *argv[])
>      s = pthread_mutex_lock(&mtx);
>      if (s == EOWNERDEAD) {
>          printf("[main thread] pthread_mutex_lock() returned EOWNERDEAD\\n");
> -	printf("[main thread] Now make the mutex consistent\\n");
> +        printf("[main thread] Now make the mutex consistent\\n");
>          s = pthread_mutex_consistent(&mtx);
>          if (s != 0)
> -	    handle_error_en(s, "pthread_mutex_consistent");
> -	printf("[main thread] Mutex is now consistent; unlocking\\n");
> +            handle_error_en(s, "pthread_mutex_consistent");
> +        printf("[main thread] Mutex is now consistent; unlocking\\n");
>          s = pthread_mutex_unlock(&mtx);
>          if (s != 0)
> -	    handle_error_en(s, "pthread_mutex_unlock");
> -
> +            handle_error_en(s, "pthread_mutex_unlock");
>          exit(EXIT_SUCCESS);
>      } else if (s == 0) {
> -	printf("[main thread] pthread_mutex_lock() unexpectedly succeeded\\n");
> -	exit(EXIT_FAILURE);
> +        printf("[main thread] pthread_mutex_lock() unexpectedly succeeded\\n");
> +        exit(EXIT_FAILURE);
>      } else {
> -	printf("[main thread] pthread_mutex_lock() unexpectedly failed\\n");
> -	handle_error_en(s, "pthread_mutex_lock");
> +        printf("[main thread] pthread_mutex_lock() unexpectedly failed\\n");
> +        handle_error_en(s, "pthread_mutex_lock");
>      }
>  }
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
