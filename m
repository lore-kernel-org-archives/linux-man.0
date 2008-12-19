From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] printf.3: Add a note about sprintf(s, "%s", s)
Date: Fri, 19 Dec 2008 18:37:33 +0100
Message-ID: <20081219173733.GC13134@machine.or.cz>
References: <20081207233721.GN10491@machine.or.cz> <cfd18e0f0812190857k187ca48ct9ee6da3b0c5a9e06@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812190857k187ca48ct9ee6da3b0c5a9e06-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Fri, Dec 19, 2008 at 11:57:05AM -0500, Michael Kerrisk wrote:
> I agree that there's a problem with the page, but I don't think this
> patch is sufficient, nor does is it made in quite the right place.
> (This isn't a point that relates specifically to "%s", but rather to
> the *s*printf() functions.)
> 
> I made a much bigger change that goes into more detail.  The patch,
> destined for 3.16, is shown below.  Does it look okay to you?

  I agree that it is better. Just out of curiosity, can you think of any
other conversions than %s that would cause this? Maybe I missed
something obvious but I could not think of anything.

-- 
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
