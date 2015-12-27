From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: socket(2) manpage - EMFILE ENFILE descriptions need swapped
Date: Sun, 27 Dec 2015 17:13:58 +0100
Message-ID: <56800E46.1050309@gmail.com>
References: <CAJYtZH=As454RY9Qo_DFQKDGGvCpyVWmBU4QtY_EGbaV_gQuXg@mail.gmail.com>
 <CAJYtZHn+jBqgty_jw9k8Djqw2O7RxvvJPOSMekYU9KggE1=Fkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYtZHn+jBqgty_jw9k8Djqw2O7RxvvJPOSMekYU9KggE1=Fkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Fee <paul.f.fee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Paul,

On 10/16/2015 02:37 PM, Paul Fee wrote:
> [Resending, hopefully as plain text this time for the benefit of
> vger.kernel.org]
> 
> Hi,
> 
> Here's the current text from the socket(2) manpage, ERRORS section:
> 
>        EMFILE Process file table overflow.
> 
>        ENFILE The system limit on the total number of open files has been
>               reached.
> 
> These appear to be the wrong way round.  Here's an extract from
> errno-base.h:
> 
> #define ENFILE          23      /* File table overflow */
> #define EMFILE          24      /* Too many open files */
> 
> In my test program, I see that errno is set to 24, with strerror()
> returning "Too many open files".  Therefore the comments in errno-base.h
> look correct and the manpage needs updating.

Well, both the man page and the comments could be better. I changed the 
man page to:

       EMFILE The  per-process  limit  on  the  number  of  open  file
              descriptors has been reached.

       ENFILE The  system-wide limit on the total number of open files
              has been reached.

EMFILE is caused by encountering the RLIMIT_NOFILE limit (see 
getrlimit(2)).

ENFILE is about encountering the /proc/sys/fs/file-max limit
(see proc(5)).

Thanks for the report!

Cheers,

Michael

> 
> Test code
> ==========
> #include <sys/socket.h>
> #include <stdio.h>
> #include <errno.h>
> #include <string.h>
> 
> int main(int argc, char* argv[])
> {
>   while(1)
>   {
>     int s = socket(AF_UNIX, SOCK_STREAM, 0);
>     printf("Created socket, fd: %d\n", s);
>     if (-1 == s)
>     {
>       printf("Error: %d: %s\n", errno, strerror(errno));
>       return 1;
>     }
>   }
>   return 0;
> }
> ==========
> 
> Thanks,
> Paul
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
