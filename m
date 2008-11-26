From: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mount(8) manpage and filesystem-specific options
Date: Thu, 27 Nov 2008 00:03:29 +0100
Message-ID: <20081126230329.GA4307@nb.net.home>
References: <20081126041558.GA9251@infradead.org> <20081126105444.GO2961@nb.net.home> <20081126200526.GX3186@webber.adilger.int>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081126200526.GX3186-RIaA196FMs1uuQVovAj/GogTZbYi8/ss@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Dilger <adilger-xsfywfwIY+M@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Nov 26, 2008 at 01:05:26PM -0700, Andreas Dilger wrote:
> I never know what man section to put a new man page in, because the
> descriptions of the section numers isn't given in the man(1) man page
> itself, nor in any document in SEE ALSO.

 Hmm... man-1.6f-4.fc9, "man man" (yes, man(1) man page):

MANUAL SECTIONS
       The standard sections of the manual include:

       1      User Commands

       2      System Calls

       3      C Library Functions

       4      Devices and Special Files

       5      File Formats and Conventions

       6      Games et. Al.

       7      Miscellanea

       8      System Administration tools and Deamons

       Distributions customize the manual section to their specifics,
       which often include additional sections.


-- 
 Karel Zak  <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
