From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] pthread_setschedparam.3: Invalid free() in example code
Date: Tue, 23 Dec 2014 16:31:27 +0100
Message-ID: <54998ACF.8020800@gmail.com>
References: <CAPQm1=PpBDnu9jW=0zuYF5X853F1HHomn3Po9vLMZ78LHq=thg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPQm1=PpBDnu9jW=0zuYF5X853F1HHomn3Po9vLMZ78LHq=thg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Newton <nomis52-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simon,

On 11/29/2014 06:41 PM, Simon Newton wrote:
> The example program will crash if -A is used, since attr is uninitialized.
> 
> $ ./a.out  -A
> *** Error in `./a.out': free(): invalid pointer: 0xb779c3c4 ***
> Aborted (core dumped)
> 
> 
> 
> diff --git a/man3/pthread_setschedparam.3 b/man3/pthread_setschedparam.3
> index 971bc0c..36b00bd 100644
> --- a/man3/pthread_setschedparam.3
> +++ b/man3/pthread_setschedparam.3
> @@ -424,9 +424,11 @@ main(int argc, char *argv[])
> 
>      /* Destroy unneeded thread attributes object */
> 
> -    s = pthread_attr_destroy(&attr);
> -    if (s != 0)
> -        handle_error_en(s, "pthread_attr_destroy");
> +    if (!use_null_attrib) {
> +      s = pthread_attr_destroy(&attr);
> +      if (s != 0)
> +          handle_error_en(s, "pthread_attr_destroy");
> +    }
> 
>      s = pthread_join(thread, NULL);
>      if (s != 0)

Thanks! Applied.

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
