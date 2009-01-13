From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] getifaddrs.3: New manual page
Date: Tue, 13 Jan 2009 18:09:06 +0100
Message-ID: <20090113170906.GS12275@machine.or.cz>
References: <20081209025634.GD10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081209025634.GD10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Tue, Dec 09, 2008 at 03:56:34AM +0100, Petr Baudis wrote:
> This patch adds documentation for the getifaddrs() and freeifaddrs()
> functions as they are supported in GNU libc. The manual page is based
> on the original BSD manpage (with licence as it appears on the top
> of the file), but is significantly rewritten for Linux manpages
> standards and containing all the differences. A simple example is
> provided.
> 
> I'm open to relicensing to any of the standard licences, this one
> should be compatible even with the classic BSD licence.
> 
> I did not do actually any testing on BSD systems about how exactly
> this call behaves, I have only tried to figure this out from their
> chaotic documentation and it wouldn't surprise me if it would in
> fact behave the same as with glibc now.  I cannot remember hostnames
> of the BSD systems I used to have an account on. ;-)
> 
> Few pages are cross-linked to point at getifaddrs(3) now, and
> inet_ntop() got another example pointer.
> 
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

  ping? :-)

				Petr "Pasky" Baudis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
