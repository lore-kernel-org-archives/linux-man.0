From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: PERF_RECORD_SWITCH support
Date: Thu, 20 Oct 2016 07:49:40 +0200
Message-ID: <d4c7c1c9-4b6c-8d25-52fe-9884bf4f3444@gmail.com>
References: <alpine.DEB.2.20.1610181320290.10811@macbook-air>
 <15d30ad2-2937-febe-d6c9-b8dded4642d8@gmail.com>
 <alpine.DEB.2.20.1610191111090.16261@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610191111090.16261@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org

On 10/19/2016 05:14 PM, Vince Weaver wrote:
> On Wed, 19 Oct 2016, Michael Kerrisk (man-pages) wrote:
> 
>>> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
>>> index 68b99bb..04a0cf5 100644
>>> +.B PERF_RECORD_SWITCH_CPU_WIDE
>>> +records when sampling in cpu-wide mode.
>>> +This functionality is in addition to existing tracepoint and
>>> +software events for measuring context switches.
>>> +The advantage of this method is that it will give full
>>
>> s/give full/give a full/
>>
>> ok?
>>
>>> +information event with strict
>>> +.I perf_event_paranoid
>>> +settings.
> 
> What I meant to say was 
> 
> "it will give full information *even* with strict perf_event_paranoid 
> settings"
> 
> Maybe saying something like "despite strict settings" would be better 
> wording.
> 
> not sure how I missed that typo, apparently my fingers are used to typing 
> "event" too much.

Thanks, Vince. Fixed now.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
