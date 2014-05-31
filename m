From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] inotify.7: Bug 77111 - watch descriptor reuse
Date: Sat, 31 May 2014 23:25:36 +0200
Message-ID: <538A48D0.8020402@gmx.de>
References: <1401385143-19306-1-git-send-email-xypron.glpk@gmx.de> <538883D9.5090709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538883D9.5090709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeff Smith <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 30.05.2014 15:12, Michael Kerrisk (man-pages) wrote:
> [Adding Jan and Eric to the CC, in case they want to comment.]
>
> Background is bugs https://bugzilla.kernel.org/show_bug.cgi?id=76851
> and https://bugzilla.kernel.org/show_bug.cgi?id=77111 . The point is:
>
> 1. When an inotify watch descriptor is removed, pending unread
>     events remain pending.
> 2. When allocating a new watch descriptor, a past WD may
>     be recycled.
> 3. In theory, it could happen that events left over at 1 could
>     be interpreted as though they belonged to the filesystem
>     object watch in step 2.
>
> On 05/29/2014 07:39 PM, Heinrich Schuchardt wrote:
>> Watch descriptor IDs are returned by inotify_add_watch.
>> When calling inotify_rm_watch an IN_IGNORE is placed on the inotify queue
>> pointing to the ID of the removed watch.
>>
>> inotify_add_watch should not return a watch descriptor ID for which events are
>> still on the queue but should return an unused ID.
>>
>> Unfortunately the existing Kernel code does not provide such a guarantee.
>
> It's unfortunate, but I'm not sure that it's very serious. I mean, in
> order to trigger this bug you need to
>
> 0. Remove your watch descriptor (wd1),
> 1. Leave some unread events for wd1 on the queue. and in the meantime,
> 2. Cycle through INT_MAX watch descriptors until you reuse wd1.
>
> Unless I'm missing something, the chances of that are vanishingly small.
> However, that's not to say that the issue shouldn't be documented. Rather,
> if the issue is as unlikely to be hit as it appears to me in the above
> formulation, then I thing the tome of the write-up should indicate
> that the problem is more theoretical than practical. Perhaps Jan or Eric
> has a comment about this.

68 events per second add up to INT_MAX events a year.

A server application restarted only once a year and handling a few 
hundred request a second may be at risk. My idling workstation rebooted 
once a day will never be hit.

I would feel more comfortable if the problem were not only documented 
but fixed.

Maybe Jan or Eric can comment on the following solution idea:

Couldn't the idr ID be released in inotify_read when hitting IN_IGNORED 
instead of being released inside inotify_rm_watch?

Best regards

Heinrich

>
>> Actually in rare cases watch descriptor IDs are returned by inotify_add_watch
>> for which events are still on the inotify queue.
>>
>> cf. https://bugzilla.kernel.org/show_bug.cgi?id=77111
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> ---
>>   man7/inotify.7 | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/man7/inotify.7 b/man7/inotify.7
>> index 1fc83f8..b1c2f6f 100644
>> --- a/man7/inotify.7
>> +++ b/man7/inotify.7
>> @@ -728,6 +728,18 @@ and the accompanying
>>   event might be fetched only on the next
>>   .BR read (2).
>>   .SH BUGS
>> +As of Linux 3.14,
>> +the following bug exists:
>> +.IP * 3
>> +.\" FIXME https://bugzilla.kernel.org/show_bug.cgi?id=77111
>> +.BR inotify_add_watch (2)
>> +may return a watch descriptor ID released by a prior call to
>> +.BR inotify_rm_watch (2)
>> +even if events for this watch descriptor still exist on the inotify queue.
>> +As a workaround the inotify file descriptor can be read until the queue is
>> +empty before calling
>> +.BR inotify_add_watch (2).
>> +.PP
>
> Perhaps a wording something like this is more appropriate:
>
> [[
> As at Linux 3.15, the a possible bug exists in the following scenario:
>
> 1. When a watch descriptor is removed, any pending unread events for
>     that watch descriptor remain available to read.
> 2. As watch descriptors are subsequently allocated with
>     inotify_ad_watch(), the kernel cycles through the range of possible
>     watch descriptors incrementally. When allocating a free watch
>     descriptor, no check is made to see whether that watch descriptor
>     number has any pending unread events in the inotify queue.
> 3. Thus, it can happen that a watch descriptor is reallocated even
>     when pending unread events exist for a previous incarnation of
>     that watch descriptor number, with the result that the application
>     might then read those events and interpret them as belonging to
>     the file associated with the newly recycle watch descriptor.
>
> However, this bug is perhaps more theoretical, than practical.
> The range for watch descriptors is from 0 to INT_MAX, so that in
> order to trigger the bug, an application must leave unread events
> on the inotify queue while recycling INT_MAX watch descriptors.
> ]]
>
>>   .\" FIXME kernel commit 611da04f7a31b2208e838be55a42c7a1310ae321
>>   .\" implies that unmount events were buggy 2.6.11 to 2.6.36
>>   .\"
>> @@ -745,7 +757,7 @@ However, as an unintended effect of other changes,
>>   since Linux 2.6.36, an
>>   .B IN_IGNORED
>>   event is generated in this case.
>> -
>> +.PP
>
> (Not sure why you added this piece?)
>
>>   Before kernel 2.6.25,
>>   .\" commit 1c17d18e3775485bf1e0ce79575eb637a94494a2
>>   the kernel code that was intended to coalesce successive identical events
>
> Cheers,
>
> Michael
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
