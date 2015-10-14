From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch 03/11] perf_event_open.2: 4.1 PERF_EVENT_IOC_SET_BPF support
Date: Wed, 14 Oct 2015 08:27:43 +0200
Message-ID: <561DF5DF.9050404@gmail.com>
References: <alpine.DEB.2.20.1507231309330.3742@vincent-weaver-1.umelst.maine.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1507231309330.3742@vincent-weaver-1.umelst.maine.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Vince Weaver <vincent.weaver@maine.edu>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Stephane Eranian <eranian@google.com>, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jiri Olsa <jolsa@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Namhyung Kim <namhyung@kernel.org>
List-Id: linux-man@vger.kernel.org

On 07/23/2015 07:10 PM, Vince Weaver wrote:
> 
> This manpage patch relates to the addition of the
> PERF_EVENT_IOC_SET_BPF ioctl in the following commit:

Thanks, Vince. Applied.

Cheers,

Michael



> 	commit 2541517c32be2531e0da59dfd7efc1ce844644f5
> 	Author: Alexei Starovoitov <ast@plumgrid.com>
>     
> 	tracing, perf: Implement BPF programs attached to kprobes
> 
> 	Signed-off-by: Alexei Starovoitov <ast@plumgrid.com>
> 	Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> 	Reviewed-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
> 	Cc: Andrew Morton <akpm@linux-foundation.org>
> 	Cc: Arnaldo Carvalho de Melo <acme@infradead.org>
> 	Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> 	Cc: Daniel Borkmann <daniel@iogearbox.net>
> 	Cc: David S. Miller <davem@davemloft.net>
> 	Cc: Jiri Olsa <jolsa@redhat.com>
> 	Cc: Linus Torvalds <torvalds@linux-foundation.org>
> 	Cc: Namhyung Kim <namhyung@kernel.org>
> 	Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
> 	Cc: Peter Zijlstra <peterz@infradead.org>
> 	Link: http://lkml.kernel.org/r/1427312966-8434-4-git-send-email-ast@plumgrid.com
> 	Signed-off-by: Ingo Molnar <mingo@kernel.org>
> 
> 
> Signed-off-by: Vince Weaver <vincent.weaver@maine.edu>
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index a6b90ec..09eda9a 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -2570,6 +2570,19 @@ This returns the event ID value for the given event file descriptor.
>  
>  The argument is a pointer to a 64-bit unsigned integer
>  to hold the result.
> +.TP
> +.BR PERF_EVENT_IOC_SET_BPF " (since Linux 4.1)"
> +.\" commit 2541517c32be2531e0da59dfd7efc1ce844644f5
> +This allows attaching a Berkeley Packet Filter (BPF)
> +program to an existing kprobe tracepoint event.
> +You need
> +.B CAP_SYS_ADMIN
> +privileges to use this ioctl.
> +
> +The argument is a BPF program file descriptor that was created by
> +a previous
> +.BR bpf (2)
> +system call.
>  .SS Using prctl
>  A process can enable or disable all the event groups that are
>  attached to it using the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
