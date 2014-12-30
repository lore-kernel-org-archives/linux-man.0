From: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Subject: Re: Addition to memcmp(3)
Date: Wed, 31 Dec 2014 00:41:06 +0100
Message-ID: <E1Y66PS-0000RC-IQ@palantir.moria.de>
References: <E1XqHLn-00041P-MO@fangorn.moria.de>
 <CAKgNAkjb4Kp+KmYj1uL9qXSJBj0JKWz8G0+eyD6UFJKFbGGPzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjb4Kp+KmYj1uL9qXSJBj0JKWz8G0+eyD6UFJKFbGGPzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> I placed this piece in a new NOTES section.
>
> Some text here about what one should do instead of using memcmp()
> might be helpful. Do you have any suggestions?

Obviously a comparison with constant CPU usage is asked for, which is
rather easy to implement given that secrets are usually only compared
for being equal.  AFAIK neither POSIX nor C99 offers a function for that.
I don't know if glibc does.  NetBSD does (consttime_memequal), but that
does not help portable code, so I have no good suggestion really.

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
