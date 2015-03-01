From: Stephane Eranian <eranian@google.com>
Subject: Re: [patch] perf_event_open.2: 3.19 PERF_SAMPLE_REGS_INTR support
Date: Sun, 1 Mar 2015 09:14:34 -0500
Message-ID: <CABPqkBQQ3JZp_BdwRJDEGpyqrchixfGG_1Lqh88HJtzXWOGE7Q@mail.gmail.com>
References: <alpine.DEB.2.11.1502120031150.17793@vincent-weaver-1.umelst.maine.edu>
	<20150228222605.GA13177@krava.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150228222605.GA13177@krava.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Olsa <jolsa@redhat.com>
Cc: Vince Weaver <vincent.weaver@maine.edu>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Chuck Ebbert <cebbert.lkml@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

Hi,

On Sat, Feb 28, 2015 at 5:26 PM, Jiri Olsa <jolsa@redhat.com> wrote:
> On Thu, Feb 12, 2015 at 12:33:09AM -0500, Vince Weaver wrote:
>>
>> This manpage patch relates to the addition of PERF_SAMPLE_REGS_INTR
>> support added in the following commit:
>
> hi,
> sorry for late response..
>
>>
>>     perf_sample_regs_intr; Linux 3.19
>>       commit 60e2364e60e86e81bc6377f49779779e6120977f
>>       Author: Stephane Eranian <eranian@google.com>
>>
>>             perf: Add ability to sample machine state on interrupt
>>
>>       Reviewed-by: Jiri Olsa <jolsa@redhat.com>
>>       Signed-off-by: Stephane Eranian <eranian@google.com>
>>       Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>       Cc: cebbert.lkml@gmail.com
>>       Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
>>       Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>       Cc: linux-api@vger.kernel.org
>>       Link: http://lkml.kernel.org/r/1411559322-16548-2-git-send-email-eranian@google.com
>>       Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>
>> From what I can tell the primary difference between
>> PERF_SAMPLE_REGS_INTR and the existing PERF_SAMPLE_REGS_USER
>> is that the new support will return kernel register values
>
> correct
I think both return the same set of registers. The difference is where
they are coming
from. for SAMPLE_REGS_INTR, they are taken from the machine state on
PMU interrupt
(taken from pt_regs). For SAMPLE_REGS_USER, they come from the last known user
level state. If PMU interrupt occurred in user space, then both flags
return the same state.
If PMU interrupt occurred in kernel space, then REGS_USER returns the
user state upon
kernel entry.

>
>> (I assume that's not some sort of info leak?).
>>
>> In theory also when precise_ip is set high enough you should
>> get the PEBS register state rather than the PMU interrupt
>> register state, but I was unable to construct a test case
>
If PEBS is used (precise_ip > 0), then REGS_INTR returns the PEBS machine state.
That is the state of the CPU at the time the precise sample is taken.
To be really
precise, it means the machine at the time the sampled instruction
retires. The difficulty
with PEBS is that it does not record all possible registers, but only
the integer registers
and EFLAGS and SP. Should the user request another register, it will
be pulled from the
interrupted state when the PEBS buffer is full. In other words, this
is a hybrid situation.
so when precise_ip > 0, user should only look at the integer
registers, eflags, sp.


> yep, if precise_ip is set you'll get the registers values
> from PEBS for PERF_SAMPLE_REGS_INTR set.. I dont think we
> do this for PERF_SAMPLE_REGS_USER regs
>
REGS_USER does not do anything with precise_ip > 0.

>> on a Haswell system where I got different values with
>> precise_ip=0, precise_ip=2, or by using PERF_SAMPLE_REGS_USER
>> instead.  Am I missing something about how to use this new
>> interface?
>
You need to describe your test better. Are you saying that the register values
you were seeing with REGS_USER, REGS_INTR, precise_ip > 0 are all
the same? That is certainly not impossible. If your PMU interrupts are all
at the user level, then REGS_INTR = REGS_USER. With precise_ip > 0,
you will get the machine state on retirement of the sampled instruction.
But if you have no sampling skid without precise_ip, then both states
the REGS_INTR and REGS_INTR+precise_ip>0 could be identical.


> Could you please describe in more details what was your test doing?
>
> the man page change below looks good to me
>
> thanks,
> jirka
>
>>
>> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
>>
>> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
>> index 39c8d8c..ca03928 100644
>> --- a/man2/perf_event_open.2
>> +++ b/man2/perf_event_open.2
>> @@ -256,7 +256,7 @@ struct perf_event_attr {
>>      __u32 sample_stack_user;    /* size of stack to dump on
>>                                     samples */
>>      __u32 __reserved_2;         /* Align to u64 */
>> -
>> +    __u64 sample_regs_intr;     /* regs to dump on samples */
>>  };
>>  .fi
>>  .in
>> @@ -350,6 +350,11 @@ and
>>  .I sample_stack_user
>>  in Linux 3.7.
>>  .\" commit 1659d129ed014b715b0b2120e6fd929bdd33ed03
>> +.B PERF_ATTR_SIZE_VER4
>> +is 104 corresponding to the addition of
>> +.I sample_regs_intr
>> +in Linux 3.19.
>> +.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
>>  .TP
>>  .I "config"
>>  This specifies which event you want, in conjunction with
>> @@ -752,6 +757,23 @@ event must be measured or no values will be recorded.
>>  Also note that some perf_event measurements, such as sampled
>>  cycle counting, may cause extraneous aborts (by causing an
>>  interrupt during a transaction).
>> +.TP
>> +.BR PERF_SAMPLE_REGS_INTR " (since Linux 3.19)"
>> +.\" commit 60e2364e60e86e81bc6377f49779779e6120977f
>> +Records a subset of the current CPU register state
>> +as specified by
>> +.IR sample_regs_intr .
>> +Unlike
>> +.B PERF_SAMPLE_REGS_USER
>> +the register values will return kernel register
>> +state if the overflow happened while kernel
>> +code is running.
>> +If the CPU supports hardware sampling of
>> +register state (as does PEBS on x86) and
>> +.I precise_ip
>> +is set higher than zero then the register
>> +values returned are those captured by
>> +hardware.
>>  .RE
>>  .TP
>>  .IR "read_format"
>> @@ -1855,6 +1877,9 @@ struct {
>>      u64   weight;     /* if PERF_SAMPLE_WEIGHT */
>>      u64   data_src;   /* if PERF_SAMPLE_DATA_SRC */
>>      u64   transaction;/* if PERF_SAMPLE_TRANSACTION */
>> +    u64   abi;        /* if PERF_SAMPLE_REGS_INTR */
>> +    u64   regs[weight(mask)];
>> +                      /* if PERF_SAMPLE_REGS_INTR */
>>  };
>>  .fi
>>  .RS 4
>> @@ -2242,6 +2267,27 @@ the high 32 bits of the field by shifting right by
>>  .B PERF_TXN_ABORT_SHIFT
>>  and masking with
>>  .BR PERF_TXN_ABORT_MASK .
>> +.TP
>> +.IR abi ", " regs[weight(mask)]
>> +If
>> +.B PERF_SAMPLE_REGS_INTR
>> +is enabled, then the user CPU registers are recorded.
>> +
>> +The
>> +.I abi
>> +field is one of
>> +.BR PERF_SAMPLE_REGS_ABI_NONE ", " PERF_SAMPLE_REGS_ABI_32 " or "
>> +.BR PERF_SAMPLE_REGS_ABI_64 .
>> +
>> +The
>> +.I regs
>> +field is an array of the CPU registers that were specified by
>> +the
>> +.I sample_regs_intr
>> +attr field.
>> +The number of values is the number of bits set in the
>> +.I sample_regs_intr
>> +bit mask.
>>  .RE
>>  .TP
>>  .B PERF_RECORD_MMAP2
>>
