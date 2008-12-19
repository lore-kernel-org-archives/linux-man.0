From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] printf.3: Add a note about sprintf(s, "%s", s)
Date: Fri, 19 Dec 2008 13:38:09 -0500
Message-ID: <cfd18e0f0812191038t7c3c221fh516bfb22040bd735@mail.gmail.com>
References: <20081207233721.GN10491@machine.or.cz>
	 <cfd18e0f0812190857k187ca48ct9ee6da3b0c5a9e06@mail.gmail.com>
	 <20081219173733.GC13134@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081219173733.GC13134-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Dec 19, 2008 at 12:37 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>  Hi,
>
> On Fri, Dec 19, 2008 at 11:57:05AM -0500, Michael Kerrisk wrote:
>> I agree that there's a problem with the page, but I don't think this
>> patch is sufficient, nor does is it made in quite the right place.
>> (This isn't a point that relates specifically to "%s", but rather to
>> the *s*printf() functions.)
>>
>> I made a much bigger change that goes into more detail.  The patch,
>> destined for 3.16, is shown below.  Does it look okay to you?
>
>  I agree that it is better. Just out of curiosity, can you think of any
> other conversions than %s that would cause this? Maybe I missed
> something obvious but I could not think of anything.

Offhand, %s is the only obvious one.  But, hey, someone could try
weird trickery with other pointers (e.g., interpret some part of the
destination buffer as a pointer to int), so I imagine that is why we
have the looser wording in the standards.

Cheers,

Michael

> --
>                                Petr "Pasky" Baudis
> The average, healthy, well-adjusted adult gets up at seven-thirty
> in the morning feeling just terrible. -- Jean Kerr
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
