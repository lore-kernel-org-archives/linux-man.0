From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and
 pthread_mutex_consistent()
Date: Tue, 12 Sep 2017 14:41:29 +0200
Message-ID: <f56e1439-7a5f-3b7a-2ec4-0970fc6ad0ad@gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com>
 <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
 <20170826210528.GA32472@HP.internal.baidu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170826210528.GA32472-BUpDV9vzqx74NUO8LpiZZi+1pv2Z1Xu3@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yubin,

[...]
> +.B PTHREAD_MUTEX_ROBUST
> +can be set on a mutex attribute object so that when the owner of the mutex
> +dies or when the process containing such a locked mutex performs
> +.IR execve (2)
> +, any future attempts to call
> +.IR pthread_mutex_lock (3)
> +on this mutex will suceed and return
> +.B EOWNERDEAD
> +to indicate that the original owner no longer exists and the mutex is left in
> +an inconsistent state. 
How did you verify the point regarding execve(2)? I don't see this
detailed mentioned in the standards or in the glibc source.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
