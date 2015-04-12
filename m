From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: realpath
Date: Sun, 12 Apr 2015 09:17:38 +0200
Message-ID: <CAKgNAkiTB8XWBfMPcRNCKfZbMaR8FJ6uDcJHPbi1jJRAr24CCg@mail.gmail.com>
References: <CAGc9EvfqDoMqqiZmgEFrHvGys27K6_erxycjqVnmOv8eXRe0uQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvfqDoMqqiZmgEFrHvGys27K6_erxycjqVnmOv8eXRe0uQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jon,

On 7 October 2013 at 20:01, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello mtk
>
> Just looking at this page:
>
> http://man7.org/linux/man-pages/man3/realpath.3.html
>
> I expect realpath could set errno to ENOMEM if malloc failed. POSIX
> page says ENOMEM too:
>
> http://pubs.opengroup.org/onlinepubs/009695399/functions/realpath.html

Agreed. I added ENOMEM.

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
