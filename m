From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] man3/getaddrinfo_a.3: New manual page
Date: Sun, 20 Sep 2009 17:05:46 +0200
Message-ID: <20090920150546.GP3674@machine.or.cz>
References: <20090422005315.GM21271@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090422005315.GM21271-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 22, 2009 at 02:53:15AM +0200, Petr Baudis wrote:
> This patch adds original documentation for the getaddrinfo_a(3)
> glibc function and the associated suite of gai_suspend(3),
> gai_error(3) and gai_cancel(3), including two example programs.
> 
> The notification facility is not demonstrated in the interactive
> frontend since I judged the would-be extra machinery as too
> obscuring (and producing potentially messy results if using
> signal notification). Maybe a third pthread example would be due?
> 
> Please review and comment.
> 
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

Ping...

Maybe just commit if you don't have time to review and let possible
bugreports flow in...?

				Petr "Pasky" Baudis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
