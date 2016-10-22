From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] perf_event_open.2: add PERF_SAMPLE_BRANCH_CALL branch
 sample type
Date: Sat, 22 Oct 2016 11:56:12 +0200
Message-ID: <d47dc0f3-ab1a-2271-847d-2b4be4d60c47@gmail.com>
References: <alpine.DEB.2.20.1610211653160.12619@macbook-air>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1610211653160.12619@macbook-air>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Vince,

On 10/21/2016 10:55 PM, Vince Weaver wrote:
> 
> Linux 4.4 (c229bf9dc179d2023e185c0f705bdf68484c1e73) added
> the PERF_SAMPLE_BRANCH_CALL branch sample type, which confusingly
> is a direct-call only subset of what PERF_SAMPLE_BRANCH_ANY_CALL
> provides.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index fade28c..8d985b3 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -1256,14 +1256,18 @@ following bits must be set.
>  Any branch type.
>  .TP
>  .B PERF_SAMPLE_BRANCH_ANY_CALL
> -Any call branch.
> -.TP
> -.B PERF_SAMPLE_BRANCH_ANY_RETURN
> -Any return branch.
> +Any call branch (includes direct calls, indirect calls, and far jumps).
>  .TP
>  .B PERF_SAMPLE_BRANCH_IND_CALL
>  Indirect calls.
>  .TP
> +.BR PERF_SAMPLE_BRANCH_CALL " (since Linux 4.4)"
> +.\" commit c229bf9dc179d2023e185c0f705bdf68484c1e73
> +Direct calls.
> +.TP
> +.B PERF_SAMPLE_BRANCH_ANY_RETURN
> +Any return branch.
> +.TP
>  .BR PERF_SAMPLE_BRANCH_IND_JUMP " (since Linux 4.2)"
>  .\" commit c9fdfa14c3792c0160849c484e83aa57afd80ccc
>  Indirect jumps.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
