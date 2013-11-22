From: Duncan de Wet <duncandewet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man 7 ascii confusion
Date: Fri, 22 Nov 2013 17:45:18 +1300
Message-ID: <20131122044518.GA11154@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Manpages version 3.44-0ubuntu1 distribution Linux Mint 15.

In man 7 ascii, there is the following sentence:

> Many 8-bit codes (such as ISO 8859-1, the Linux default character set)
> contain ASCII as their lower half.

Locales now use UTF-8 by default. This sentence should probably be
changed to something explaining how UTF-8 works, like:

> Many 8-bit codes contain ASCII as their lower half. The Linux default
> character set, UTF-8, fits thousands of characters through non-ASCII
> characters using more than one upper-half byte.

Or something like that, I'm no expert.

-- 
Duncan de Wet
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
