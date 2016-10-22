From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH 1/2] perf_event_open.2: Document
 PERF_EVENT_IOC_PAUSE_OUTPUT
Date: Sat, 22 Oct 2016 12:00:14 +0200
Message-ID: <cf11df62-04f6-57fc-12ee-975f91ef0bd6@gmail.com>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com>
 <alpine.DEB.2.20.1610211710440.16183@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610211710440.16183@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>, Wang Nan <wangnan0@huawei.com>
Cc: mtk.manpages@gmail.com, pi3orama@163.com, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, lizefan@huawei.com
List-Id: linux-man@vger.kernel.org

On 10/21/2016 11:16 PM, Vince Weaver wrote:
> On Fri, 21 Oct 2016, Wang Nan wrote:
> 
> 
>> -.SS Using prctl(2)
>> +.SS Using prctl
> 
> why this change?

I suspect a diff against a slight stale version of the page, 
since I added the '(2)' just a few days ago. Wang Nan, please
do pull the latest version of the page :-).

>> +.BR PERF_EVENT_IOC_PAUSE_OUTPUT " (since Linux 4.7)"
>> +.\" commit 86e7972f690c1017fd086cdfe53d8524e68c661c
>> +This allows pausing and resuming the event's ring-buffer. A
>> +paused ring-buffer does not prevent samples generation, but simply
>> +discards them. The discarded samples are considered lost, causes
>> +.BR PERF_RECORD_LOST
>> +to be generated when possible.
> 
> I don't know if it's worth mentioning that the reason to add this is to 
> allow reading the ring-buffer without having to worry about data being
> overwritten.

Wang Nan, what do you you thing. Should this be added?

> There are a few odd wording choices (mostly plural nouns) but otherwise 
> looks fine to me.
> 
> Reviewed-by: Vince Weaver <vincent.weaver@maine.edu>

Wang Nan, I'll send a few wording corrections. Could you please include 
Vince's reviewed by tag on your next revision?

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
