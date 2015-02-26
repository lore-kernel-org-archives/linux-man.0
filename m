From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: Exclude_hv clarification
Date: Thu, 26 Feb 2015 08:50:33 +0100
Message-ID: <54EED049.6090805@gmail.com>
References: <alpine.DEB.2.11.1502111402140.16882@vincent-weaver-1.umelst.maine.edu> <54E2D272.1080607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E2D272.1080607@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-man@vger.kernel.org

Hello Paul,

Ping!

Cheers,

Michael


On 02/17/2015 06:32 AM, Michael Kerrisk (man-pages) wrote:
> Hi Paul Mackerass,
> 
> Would you be willing to review/comment on Vince's patch, please.
> 
> Cheers,
> 
> Michael
> 
> On 02/11/2015 08:04 PM, Vince Weaver wrote:
>>
>> This manpage patch relates to the exclude_hv bit added to the kernel
>> in the following commit:
>>
>>     exclude_hv; Linux 2.6.31
>>         commit 0475f9ea8e2cc030298908949e0d5da9f2fc2cfe
>>         Author: Paul Mackerras <paulus@samba.org>
>>
>>             perf_counters: allow users to count user, kernel and/or hypervisor events
>>
>>             Signed-off-by: Paul Mackerras <paulus@samba.org>
>>
>> The updated manpage text points out that the exclude_hv 
>> "exclude hypervisor" bit only applies on hardware that 
>> supports this  feature (such as PowerPC)
>> and is silently ignored on other platforms such as x86.
>>
>> This is a resend of the patch; the previous time I sent it
>> (http://thread.gmane.org/gmane.linux.man/7500) it did not
>> receive any comments.
>>
>>
>> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
>>
>> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
>> index 39c8d8c..665aa31 100644
>> --- a/man2/perf_event_open.2
>> +++ b/man2/perf_event_open.2
>> @@ -856,10 +856,9 @@ If this bit is set, the count excludes events that happen in kernel-space.
>>  .IR "exclude_hv"
>>  If this bit is set, the count excludes events that happen in the
>>  hypervisor.
>> -This is mainly for PMUs that have built-in support for handling this
>> -(such as POWER).
>> -Extra support is needed for handling hypervisor measurements on most
>> -machines.
>> +This is mainly for PMUs that have built-in hardware support
>> +for this feature (such as POWER; this setting is silently
>> +ignored on x86).
>>  .TP
>>  .IR "exclude_idle"
>>  If set, don't count when the CPU is idle.
>>
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
