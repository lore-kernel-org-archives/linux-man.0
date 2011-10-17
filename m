From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: aio manuals
Date: Mon, 17 Oct 2011 15:53:41 -0400
Message-ID: <x49botfl7i2.fsf@segfault.boston.devel.redhat.com>
References: <20110309180600.GA14533@saboteur.suse.cz>
	<x49ei6gnpsx.fsf@segfault.boston.devel.redhat.com>
	<20110316104356.GB32095@saboteur.suse.cz>
	<x49pqpr9m5l.fsf@segfault.boston.devel.redhat.com>
	<20110316152018.GG2096@saboteur.suse.cz>
	<20111013082918.GA17800@saboteur.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111013082918.GA17800-n1fJoQsqRnsVI8jrpt9EEQ@public.gmane.org> (Cyril Hrubis's message
	of "Thu, 13 Oct 2011 10:29:18 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> writes:

> Hi!
>> > > So should we settle for memset()? I could update send updated patch
>> > > then.
>> > 
>> > Yeah, memset is what I typically have done.
>> > 
>> 
>> Here comes updated patch.
>
> I've checked the latest man pages git and these changes aren't there
> yet. Any comments?
>> @@ -42,8 +42,12 @@ Link with \fI\-laio\fP.
>>  .BR io_setup ()
>>  creates an asynchronous I/O context capable of receiving
>>  at least \fInr_events\fP.
>> -\fIctxp\fP must not point to an AIO context that already exists, and must
>> +The \fIctxp\fP must not point to an AIO context that already exists, and must
>>  be initialized to 0 prior to the call.
>> +
>> +Note that io_context_t is opaque type and thuss \fIctxp\fP should be zeroed

One extra 's' in thus.

other than that, looks good to me.

-Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
