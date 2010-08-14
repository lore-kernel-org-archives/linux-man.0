From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: lseek(2) BSD buglet
Date: Sat, 14 Aug 2010 05:48:40 -0400
Message-ID: <20100814094840.GA6217@infradead.org>
References: <201008111813.OAA03192@Sparkle.Rodents-Montreal.ORG>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201008111813.OAA03192-23rEAq0nvmRBjDB12xDq2QQ+uF9fDdDi0Z6qq+Mcf0E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: der Mouse <mouse-QYwwddsQ6tkEPrhfXw3Q4tGeqqvjHH9B@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 11, 2010 at 02:13:35PM -0400, der Mouse wrote:
> lseek(2) (noticed on 3.23, 3.25 has similar wording) says, in part,
> 
>        SVr1-3 returns long instead of off_t, BSD returns int.
> 
> While the BSDs are not a single monolithic entity, NetBSD has returned
> off_t from lseek(2) since 1.5 at the very latest, meaning late 2000.
> I'd be surprised if there's a non-orphaned BSD left that still uses
> int.
> 
> I'm not sure what wording would be best.  Depends on whether you think
> it's worth mentioning the historical practice from the days when BSD
> deserved the B in its name or not, I'd say.  Perhaps something like

I think removing it is fine.  Historical SysV and BSD behaviour might have
been interesting in the early 90s, but these days it's something for a
history book and not a manual page.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
