From: der Mouse <mouse-QYwwddsQ6tkEPrhfXw3Q4tGeqqvjHH9B@public.gmane.org>
Subject: Re: lseek(2) BSD buglet
Date: Sat, 14 Aug 2010 10:09:41 -0400 (EDT)
Message-ID: <201008141409.KAA00313@Sparkle.Rodents-Montreal.ORG>
References: <201008111813.OAA03192@Sparkle.Rodents-Montreal.ORG>
	<20100814094840.GA6217@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100814094840.GA6217-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>> lseek(2) (noticed on 3.23, 3.25 has similar wording) says, in part,

>>        SVr1-3 returns long instead of off_t, BSD returns int.

> I think removing it is fine.  Historical SysV and BSD behaviour might
> have been interesting in the early 90s, but these days it's something
> for a history book and not a manual page.

Sounds like a reasonable point of view to me.

However, since the manpages are also one of the places people go when
trying to figure out old code, I'd probably not delete it entirely but
instead replace it with something alojng the lines of

	Hisorical practice has varied, but modern systems uniformly use
	off_t.

But, really, even that may be more than is worth bothering with; it's
been a long time since lseek returning non-off_t mattered to anyone but
hardcore retrocomputing geeks.

/~\ The ASCII				  Mouse
\ / Ribbon Campaign
 X  Against HTML		mouse-NcIlfYlhY41Ekk/fuQG8RGD2FQJk+8+b@public.gmane.org
/ \ Email!	     7D C8 61 52 5D E7 2D 39  4E F1 31 3E E8 B3 27 4B
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
