From: Theodore Tso <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH] mount.2 : Add MS_SILENT mountflag
Date: Fri, 3 Oct 2008 17:23:20 -0400
Message-ID: <20081003212319.GB11442@mit.edu>
References: <9debc4410809300453p638d3515sc2ae330263039b9c@mail.gmail.com> <cfd18e0f0810010621r604274cdnaeed129067f9c4e2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0810010621r604274cdnaeed129067f9c4e2-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Oct 01, 2008 at 03:21:27PM +0200, Michael Kerrisk wrote:
> (Ted, your input would be welcome below.)
> 
>
> I've rewritten and expanded this somewhat, making it:
> 
>        MS_SILENT (since Linux 2.6.17)
>               Suppress the display of certain (printk()) warning
>               messages  in the kernel log.  This flag supersedes
>               the misnamed and obsolete MS_VERBOSE flag  (avail-
>               able since Linux 2.4.12), which has the same mean-
>               ing.
> 
> Does that seem okay to the two of you?

Looks good to me!

Acked-by: "Theodore Ts'o" <tytso-3s7WtUTddSA@public.gmane.org>

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
