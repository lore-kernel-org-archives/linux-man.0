From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Retry: man pages bug in snprintf (3)
Date: Mon, 30 Dec 2013 20:52:17 +1300
Message-ID: <52C12631.8080209@gmail.com>
References: <CAF2ooDxfNBV+x=SnWc853fagRuME7QZh1P61prQ_djF-6yRNGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF2ooDxfNBV+x=SnWc853fagRuME7QZh1P61prQ_djF-6yRNGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arif Zaman <arifz-fYzJem42smjeSsnKWxLhYw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/13/13 10:24, Arif Zaman wrote:
> Sorry, my last message contained html. Here is a plain-text version of the same thing.
> 
> In the final example on the man page for snprintf (3),
> 
> after the /* check error code */ there should be:
> 
>         if (n < 0) {
>             free(p);
>             return NULL;
>         }
> 
> in order to avoid a memory leak.
> 
> This was discussed on http://stackoverflow.com/questions/19933479/snprintf-man-page-example-memory-leak.

Thanks for reporting this. I made the change as you suggest.

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
