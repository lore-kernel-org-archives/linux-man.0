From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getlogin(3): mention loginuid
Date: Wed, 18 May 2016 22:36:37 +0200
Message-ID: <8ee6ef8b-c976-0410-e525-42689b4bdf94@gmail.com>
References: <CAGWcZkJFZZQgCAs4JnnGBj1jSh9aYdBiDUhRA+yj1Wx64H0xXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGWcZkJFZZQgCAs4JnnGBj1jSh9aYdBiDUhRA+yj1Wx64H0xXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/23/2016 11:00 PM, Egmont Koblinger wrote:
> Hi,
> 
> I just got to know about /proc/self/loginuid, as well as getlogin(3)
> referring to this file prior to utmp, by browsing this bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=1328947 (esp. comments
> 13-17 are relevant).
> 
> getlogin(3)'s manual page does not mention this at all. (And, for the
> record, neither does proc(5), it has a FIXME comment about it).
> 
> Could you please fill in this gap?

Hello Egmont,

Can you provide some information about this field? If not a patch
to the man page, then at least some descriptive text?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
