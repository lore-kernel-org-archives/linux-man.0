From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] inotify.7: Bug 77111 - watch descriptor reuse
Date: Sun, 01 Jun 2014 10:39:37 +0200
Message-ID: <538AE6C9.2060202@gmail.com>
References: <1401385143-19306-1-git-send-email-xypron.glpk@gmx.de> <538883D9.5090709@gmail.com> <538A48D0.8020402@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538A48D0.8020402-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jeff Smith <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/31/2014 11:25 PM, Heinrich Schuchardt wrote:
> On 30.05.2014 15:12, Michael Kerrisk (man-pages) wrote:
>> [Adding Jan and Eric to the CC, in case they want to comment.]
>>
>> Background is bugs https://bugzilla.kernel.org/show_bug.cgi?id=76851
>> and https://bugzilla.kernel.org/show_bug.cgi?id=77111 . The point is:
>>
>> 1. When an inotify watch descriptor is removed, pending unread
>>     events remain pending.
>> 2. When allocating a new watch descriptor, a past WD may
>>     be recycled.
>> 3. In theory, it could happen that events left over at 1 could
>>     be interpreted as though they belonged to the filesystem
>>     object watch in step 2.
>>
>> On 05/29/2014 07:39 PM, Heinrich Schuchardt wrote:
>>> Watch descriptor IDs are returned by inotify_add_watch.
>>> When calling inotify_rm_watch an IN_IGNORE is placed on the inotify queue
>>> pointing to the ID of the removed watch.
>>>
>>> inotify_add_watch should not return a watch descriptor ID for which events are
>>> still on the queue but should return an unused ID.
>>>
>>> Unfortunately the existing Kernel code does not provide such a guarantee.
>>
>> It's unfortunate, but I'm not sure that it's very serious. I mean, in
>> order to trigger this bug you need to
>>
>> 0. Remove your watch descriptor (wd1),
>> 1. Leave some unread events for wd1 on the queue. and in the meantime,
>> 2. Cycle through INT_MAX watch descriptors until you reuse wd1.
>>
>> Unless I'm missing something, the chances of that are vanishingly small.
>> However, that's not to say that the issue shouldn't be documented. Rather,
>> if the issue is as unlikely to be hit as it appears to me in the above
>> formulation, then I thing the tome of the write-up should indicate
>> that the problem is more theoretical than practical. Perhaps Jan or Eric
>> has a comment about this.
> 
> 68 events per second add up to INT_MAX events a year.
> 
> A server application restarted only once a year and handling a few 
> hundred request a second may be at risk. My idling workstation rebooted 
> once a day will never be hit.

Yes, but you skip the other piece of the puzzle. This bug relies on us
not reading events while at the same time cycling through INT_MAX watches.
That's pretty unlikey in a sane application.

> I would feel more comfortable if the problem were not only documented 
> but fixed.

Agreed, it's better if the bug were not there. It's a question of 
how much effort is required, and if there would be any significant 
performance hit associated with the fix. Weighed up against the risk
that the bug could be hit.

> Maybe Jan or Eric can comment on the following solution idea:
> 
> Couldn't the idr ID be released in inotify_read when hitting IN_IGNORED 
> instead of being released inside inotify_rm_watch?

See comments above. What would be the performance impact here? This
would be some kind of check on *every* read(), no?
Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
