From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: mount(8) manpage and filesystem-specific options
Date: Tue, 25 Nov 2008 23:15:58 -0500
Message-ID: <20081126041558.GA9251@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Currently the mount(8) manpages which is contained inside util-linux
has a list of mount options for various filesystem.  Now the filesystems
are in the kernel tree and can change options without affecting the
mount binary, and of course do so frequently.  This means these options
are frequently out of date.  All these options also make the manpage
quite large and harder to read.  What do peope think about adding a
(section 4?) manpage for every common filesystem in the man-pages
repository instead which people seems to help updating nowdays when
doing user ABI changes, and linking from the mount manpage to it?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
