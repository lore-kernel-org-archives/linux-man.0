From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page bug report about pthread_join
Date: Mon, 29 Aug 2016 09:58:43 +1200
Message-ID: <590f86e0-6af1-5fd6-d1ac-c798acbd4763@gmail.com>
References: <CAPrqJzHFonOuZW+k=G662CK59gpftyUCdPsYFSRUWRRDbfCaLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPrqJzHFonOuZW+k=G662CK59gpftyUCdPsYFSRUWRRDbfCaLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?546L5a6I5aCw?= <wangshouyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello 王守堰,

On 08/24/2016 09:11 PM, 王守堰 wrote:
> Hi:
>   I have checked the newest version of pthread_join at
> *http://man7.org/linux/man-pages/man3/pthread_join.3.html
> <http://man7.org/linux/man-pages/man3/pthread_join.3.html>*
>   I think there exists something wront in this sentence:
> 
> If *retval* is not NULL, then *pthread_join*() copies the exit status of
>        the target thread (i.e., the value that the target thread supplied to
>        pthread_exit(3)
> <http://man7.org/linux/man-pages/man3/pthread_exit.3.html>) into the
> location pointed to by **retval*.
> 
> I think it should be "into the location pointed to by *retval" *or
> "into **retval".*
> 
> Because the actual behavior of pthread_join() is like:  *retval = exit_status;
> 
> But the current man page description means: *(*retval) = exit_status;
> 
> Do you agree with me?
> 
> Hope your reply.

I agree that there is a bit of confusion in the wording of the page.
I changed this paragraph to read:

       If retval is not NULL, then pthread_join() copies the exit  status
       of  the target thread (i.e., the value that the target thread sup‐
       plied to pthread_exit(3)) into the location pointed to by  retval.
       If the target thread was canceled, then PTHREAD_CANCELED is placed
       in the location pointed to by retval.

Okay?

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
