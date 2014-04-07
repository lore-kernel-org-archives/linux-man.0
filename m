From: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH 0/1] Manpages for the fanotify API
Date: Mon, 7 Apr 2014 10:48:19 +0200
Message-ID: <20140407084819.GA14927@quack.suse.cz>
References: <5330A257.9080100@gmail.com>
 <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de>
 <5341461A.3090405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5341461A.3090405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: xypron.glpk-Mmb7MZpHnFY@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, jack-AlSwsSmVLrQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun 06-04-14 14:18:34, Michael Kerrisk (man-pages) wrote:
> >  >> The pages say nothing about merging of events. Merging can happen
> >  >> for non-permission events, but not for permission events.
> >  >> Something needs to be said about this, probably in fanotify(7)
> >  >> If you are unsure of what I mean, just add the following in
> >  >> fanotify(7)
> > 
> > You missed this sentence: "The bitmask in mask signals which events
> > have occured for a single file system object. More than one of the
> > following flags can be set at once in the bitmask."
> > 
> > Jan Kara wrote, that the only guarantee given is, that no two
> > permission events will be merged.
> > 
> > I reworked fanotify.7.
> 
> I think you've misunderstood what I mean by merging.
> 
> Say there is a read on a file being monitored with FAN_CLASS_NOTIFY. 
> Suppose also that the reader of the fanotify FD does not yet
> read the event. Now suppose a second read occurs on the monitored
> file. Are there now two events in the queue, or one (because the 
> identical events have been merged)? For "inotify", the answer 
> is "1". I suspect it is the same for fanotify. The man page
> should say something about this (if I am correct).
  For FAN_CLASS_NOTIFY, there's only one event in the queue in the same
way as for inotify. Actually fanotify is even more aggressive in merging
events and if you monitor for read & write and the application does read,
write, read, there will still be only one event in the queue whose mask
will be FAN_ACCESS | FAN_MODIFY.

However if you monitor with FAN_CLASS_CONTENT or FAN_CLASS_PRE_CONTENT and
you ask for doing access validation (FAN_OPEN_PERM, FAN_ACCESS_PERM mark
types), then the resuling events will not be merged. I.e. two consecutive
reads of the same file result in two FAN_ACCESS_PERM events in the queue.
If the file is also watched e.g. for FAN_MODIFY, such event may but needn't
be merged with the FAN_ACCESS_PERM events (what happens will be actually
dependent on kernel version).

								Honza
-- 
Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
SUSE Labs, CR
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
