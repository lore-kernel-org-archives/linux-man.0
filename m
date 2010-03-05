From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] setenv.3, putenv.3: Elaborate on thread (non-)safety
Date: Sat, 6 Mar 2010 00:43:02 +0100
Message-ID: <20100305234302.GI5075@machine.or.cz>
References: <20100224204625.GD19115@machine.or.cz>
 <201003051446.14847.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201003051446.14847.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 05, 2010 at 02:46:13PM -0500, Mike Frysinger wrote:
> On Wednesday 24 February 2010 15:46:25 Petr Baudis wrote:
> > +thus consults $TZ deep inside). Thus, modifying environment
> > +in multi-threaded applications should be avoided if at all possible,
> 
> modifying environment -> modifying the environment
> 
> > +or special measures taken so that no non-obvious library functions
> > +get called meanwhile.
> 
> "no non" is funky.  how about:
> 	so that non-obvious library functions are not called in the meanwhile.

Good catches in both cases, thanks!

-- 
				Petr "Pasky" Baudis
http://pasky.or.cz/ | "Ars longa, vita brevis." -- Hippocrates
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
