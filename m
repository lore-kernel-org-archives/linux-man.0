From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getopt.3
Date: Sun, 12 Apr 2015 09:21:35 +0200
Message-ID: <CAKgNAkgqpVDzuCHRTWY3=pnBvoV4Roe3FU6yjj=KV8rFBXBG5A@mail.gmail.com>
References: <CAGc9EveyW=7Oy2NBfy+V2kjEHhzxkY5Keh2+eU_hff8kbBQt9Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EveyW=7Oy2NBfy+V2kjEHhzxkY5Keh2+eU_hff8kbBQt9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jonny,

On 11 November 2014 at 23:27, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> http://man7.org/linux/man-pages/man3/getopt.3.html
>
> Hello
>
> I noticed that "nsecs = 0;" is not needed in the getopt source code example.
>
> GCC gives warning about this variable being initialised.

But it is used:

           printf("flags=%d; tfnd=%d; nsecs=%d; optind=%d\n",
                   flags, tfnd, nsecs, optind)

Am I missing the point of your report?

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
