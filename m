From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: PERF_SAMPLE_BRANCH_IND_JUMP
 branch_sample_type
Date: Sat, 15 Oct 2016 09:13:32 +0200
Message-ID: <0b12315e-d292-169b-6a9f-566d667d2386@gmail.com>
References: <alpine.DEB.2.20.1610141628010.29438@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610141628010.29438@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
List-Id: linux-man@vger.kernel.org

On 10/14/2016 10:31 PM, Vince Weaver wrote:
> 
> Linux 4.2 added a new branch_sample_type: PERF_SAMPLE_BRANCH_IND_JUMP

Thanks, Vince. Applied!

Cheers,

Michael

> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index afdee49..cd49cbb 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1247,6 +1247,10 @@ Any return branch.
>  .B PERF_SAMPLE_BRANCH_IND_CALL
>  Indirect calls.
>  .TP
> +.BR PERF_SAMPLE_BRANCH_IND_JUMP " (since Linux 4.2)"
> +.\" commit c9fdfa14c3792c0160849c484e83aa57afd80ccc
> +Indirect jumps.
> +.TP
>  .BR PERF_SAMPLE_BRANCH_COND " (since Linux 3.16)"
>  .\" commit bac52139f0b7ab31330e98fd87fc5a2664951050
>  Conditional branches.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
