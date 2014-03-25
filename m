From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Man pages for the fanotify API: merging of events
Date: Tue, 25 Mar 2014 17:37:36 +0100
Message-ID: <20140325163736.GA17292@quack.suse.cz>
References: <53271880.4090100@gmail.com>
 <1395506528-10026-1-git-send-email-xypron.glpk@gmx.de>
 <5330A257.9080100@gmail.com>
 <5331A343.9070403@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5331A343.9070403-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hello,

On Tue 25-03-14 16:39:47, Heinrich Schuchardt wrote:
> could , please, help me to get the following fixed:
> 
> On 24.03.2014 22:23, Michael Kerrisk (man-pages) wrote:
> >The pages say nothing about merging of events. Merging can happen
> >for non-permission events, but not for permission events.
> >Something needs to be said about this, probably in fanotify(7)
> >If you are unsure of what I mean, just add the following in
> >fanotify(7)
> >
> >.\" FIXME Document merging of events
> At least there was: "The bitmask in *mask* signals which events
> have occured for a single file system object. More than one of the
> following flags can be set at once in the bitmask."
> 
> But this of cause does not describe that consecutive events might
> have been merged (=> Needs to be fixed in man page).
> 
> In the current coding permission events are not merged with other
> events.
> 
> This feature did not exist in the kernel until two months ago, while
> the API is much older.
> 
> See patch
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13116dfd13c8c9d60ea04ece13419af2de8e2e37
> 
> What I am unsure about is, whether the fanotify manpage should make
> any assumption that this feature will hold true for future kernel
> releases.
  So, we certainly guarantee that two permission events are never merged
(because they may need response from userspace and the number of permission
requests and responses should better match). Other merging is at a
discretion of the kernel - it may happen but does not have to.

> To me not merging permission events with other events seems rather
> to be a fix for some coding internal problem not something that
> typically would go into the specification.
  Yes, it's just making life simpler for the kernel.

								Honza
-- 
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
