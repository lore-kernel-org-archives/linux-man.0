From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Man pages for the fanotify API: merging of events
Date: Tue, 25 Mar 2014 16:39:47 +0100
Message-ID: <5331A343.9070403@gmx.de>
References: <53271880.4090100@gmail.com> <1395506528-10026-1-git-send-email-xypron.glpk@gmx.de> <5330A257.9080100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5330A257.9080100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

could , please, help me to get the following fixed:

On 24.03.2014 22:23, Michael Kerrisk (man-pages) wrote:
> The pages say nothing about merging of events. Merging can happen
> for non-permission events, but not for permission events.
> Something needs to be said about this, probably in fanotify(7)
> If you are unsure of what I mean, just add the following in
> fanotify(7)
>
> .\" FIXME Document merging of events
At least there was: "The bitmask in *mask* signals which events
have occured for a single file system object. More than one of the
following flags can be set at once in the bitmask."

But this of cause does not describe that consecutive events might have 
been merged (=> Needs to be fixed in man page).

In the current coding permission events are not merged with other
events.

This feature did not exist in the kernel until two months ago, while the 
API is much older.

See patch
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=13116dfd13c8c9d60ea04ece13419af2de8e2e37

What I am unsure about is, whether the fanotify manpage should make any 
assumption that this feature will hold true for future kernel releases.

To me not merging permission events with other events seems rather to be 
a fix for some coding internal problem not something that typically 
would go into the specification.

What is your opinion?

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
