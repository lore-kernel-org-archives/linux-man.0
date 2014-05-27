From: Jeff Smith <jsmith.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: inotify_rm_watch() user-space safety requirements?
Date: Tue, 27 May 2014 15:04:13 -0500
Message-ID: <CAAih0NiGsXJcbZZgFKM4ttcmr6r3=Jr2iEuhPYu9QaJZ8zOHag@mail.gmail.com>
References: <CAAih0NjG4gC-7fkD5vOvF0CQks+DhqVZLeycsju-8RMVP6dbBw@mail.gmail.com>
	<5384E83B.1030209@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5384E83B.1030209-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

Thanks for looking into this. I've never encountered the aliasing via
wraparound or otherwise, but I've tried to code against unexpected
descriptor reuse anyway through more flexible workarounds. From a user
standpoint, denser descriptor reassignment would be preferable to
facilitate simple dense linear mappings of cache objects, but it's
easy to see why things were designed as they were given the queue
entry persistence. Getting current behavior accurately documented is
my first hope, and fixing any gotcha cases my second, but being able
to have inotify_add_watch/read look and feel more like
open/epoll_ctl(EPOLL_CTL_ADD))/epoll_wait would be my ultimate wish.
The asynchronous-feeling handle removal is not a great interface in
general to deal with.

Best regards,
Jeff

On Tue, May 27, 2014 at 2:32 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> On 27.05.2014 19:25, Jeff Smith wrote:
>>
>> inotify's behavior concerning events from removed watches (they do
>> happen) and watch descriptor reuse (beyond my knowledge) is currently
>> undocumented.
>>
>> Although it mimics a standard multiplexing interface in most regards,
>> writing a robust user-space handler is comparatively more complex due
>> to the atypical delivery of "stale" wd events preceding an IN_IGNORE
>> event and a lack of guarantees about how quickly a wd can be reused
>> via inotify_add_watch(). Not being familiar with inotify/fsnotify
>> internals, it's not trivially obvious to me how the fsnotify_group
>> management is being done. Up to the present, I've maintained queues of
>> "dead" wd wrappers (or at least a counter) to filter stale events, but
>> I am clueless whether or not this is overkill.
>>
>> If removed descriptors are reserved until the IN_IGNORE event is
>> drained from the read queue, could that be formally guaranteed? If
>> it's not, is it functionality that could ever reasonably be expected
>> to be added, short of some other form of new (optional?)
>> queue-filter-on-rm functionality? It's my experience that the
>> asynchronous handling of watch removals is a cost that seldom serves
>> much user benefit.
>>
>> Regards,
>> Jeff
>
> Hello Jeff,
>
> I tried to dive a bit into the code. This is what I understand:
>
> Function inotify_ignored_and_remove_idr is called after the mark has been
> removed. This function puts an IN_IGNORED event onto the inotify queue and
> removes the watch descriptor from the list of used watch descriptors using
> function idr_remove.
>
> With a test program I could receive the IN_IGNORED event. This behavior is
> currently not documented in the manpages (inotify.7 and inotify_rm_watch.2).
>
> When inotify_add_watch is called it uses function idr_alloc_cyclic to assign
> a watch descriptor ID. This function starts looking for an unused id
> starting with the id after the last assigned watch descriptor.
>
> This implies that in most cases inotify_add_watch will return a watch
> descriptor different to the one released by a prior call to
> inotify_rm_watch. But there is no guarantee.
>
> I consider this a bug.
>
> I CCed the maintainers of the inotify interface hoping that they can provide
> a better solution.
>
> Until such a solution is provided I suggest you use the following
> workaround. After calling inotify_rm_watch read from the inotify file
> descriptor until you reach the matching IN_IGNORED event.
>
> Only thereafter you can safely call inotify_add_watch again.
>
> Best regards
>
> Heinrich Schuchardt
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
