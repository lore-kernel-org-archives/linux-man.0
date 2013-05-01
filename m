From: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Subject: Re: Typo in tzfile man page
Date: Wed, 1 May 2013 19:03:23 +0200
Message-ID: <20130501170323.GA19612@glenfiddich.mraw.org>
References: <CACBhJdEY5E28iTmSdbuofZV98d4TOw1iX68X7J0JsvrM4w7rrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACBhJdEY5E28iTmSdbuofZV98d4TOw1iX68X7J0JsvrM4w7rrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezio Melotti <ezio.melotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Tue, Apr 30, 2013 at 11:03:03AM +0300, Ezio Melotti wrote:
> The second line of the "Description" of the tzfile man page contains a typo:
> "The time zone information files used by tzset(3) begin with the magic
> characters "TZif" to identify then as time zone information files"
> 
> s/then/them/
> 
> $ man -w 5 tzfile
> /usr/share/man/man5/tzfile.5.gz
> $ dpkg -p manpages-dev | grep Version
> Version: 3.40-0.1ubuntu3

Fixed since man-pages-3.41 by commit
commit 56c4cc3618d12e91128199528b63241c3a2675ec
Author: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri May 4 06:52:26 2012 +1200

    tzfile.5: Mention timezone directories in DESCRIPTION

FYI, you check whether a bug is already fixed upstream by checking online
manpages at http://man7.org/linux/man-pages/man5/tzfile.5.html

Best regards.

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
