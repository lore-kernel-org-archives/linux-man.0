From: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mount(8) manpage and filesystem-specific options
Date: Wed, 26 Nov 2008 11:54:44 +0100
Message-ID: <20081126105444.GO2961@nb.net.home>
References: <20081126041558.GA9251@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081126041558.GA9251-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 25, 2008 at 11:15:58PM -0500, Christoph Hellwig wrote:
> Currently the mount(8) manpages which is contained inside util-linux
> has a list of mount options for various filesystem.  Now the filesystems
> are in the kernel tree and can change options without affecting the
> mount binary, and of course do so frequently.  This means these options
> are frequently out of date.  All these options also make the manpage

 Yes, you're right.

> quite large and harder to read.  What do peope think about adding a
> (section 4?) manpage for every common filesystem in the man-pages

 Something like this is on my wish list for long time ;-)

> repository instead which people seems to help updating nowdays when
> doing user ABI changes, and linking from the mount manpage to it?

 Do we have man-power to maintain the same thing on two places?

 The FS specific options are already documented in the kernel
 Documentation/ directory. I have no strong opinion about it, but I
 think the best solution is to maintain this docs on one place only.
 The place should be in the kernel tree otherwise developers will
 ignore the docs... (it's pretty simple to reject kernel patches
 without proper Documentation/ update).

 What about to keep this kernel docs in a parse-able (ascidoc?) format
 and generate the final man pages from this primary source. The final
 man pages could be distributed by util-linux-ng or man-pages.

    Karel

-- 
 Karel Zak  <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
