From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] perf_event_open.2: add type kprobe and uprobe
Date: Tue, 9 Jan 2018 20:15:32 +0100
Message-ID: <b88c5109-6a2c-f486-e617-e9f60a1fa096@gmail.com>
References: <20180109012154.1146884-1-songliubraving@fb.com>
 <20180109012154.1146884-2-songliubraving@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109012154.1146884-2-songliubraving-b10kYP2dOMg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-team-b10kYP2dOMg@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Song Liu,

On 01/09/2018 02:21 AM, Song Liu wrote:
> Two new types kprobe and uprobe are being added to perf_event_open,
> which allow creating kprobe or uprobe with perf_event_open. This
> patch adds information about these types.
> 
> Signed-off-by: Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>
> ---
>  man2/perf_event_open.2 | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/man2/perf_event_open.2 b/man2/perf_event_open.2
> index c91da3f..1bfe7bf 100644
> --- a/man2/perf_event_open.2
> +++ b/man2/perf_event_open.2
> @@ -256,11 +256,15 @@ struct perf_event_attr {
>  
>      union {
>          __u64 bp_addr;          /* breakpoint address */
> +        __u64 kprobe_func;      /* for perf_kprobe */
> +        __u64 uprobe_path;      /* for perf_uprobe */
>          __u64 config1;          /* extension of config */
>      };
>  
>      union {
>          __u64 bp_len;           /* breakpoint length */
> +        __u64 kprobe_addr;      /* with kprobe_func == NULL */
> +        __u64 probe_offset;     /* for perf_[k,u]probe */
>          __u64 config2;          /* extension of config1 */
>      };
>      __u64 branch_sample_type;   /* enum perf_branch_sample_type */
> @@ -336,6 +340,13 @@ field.
>  For instance,
>  .I /sys/bus/event_source/devices/cpu/type
>  contains the value for the core CPU PMU, which is usually 4.
> +.TP
> +.BR kprobe " and " uprobe " (since Linux 4.16)"
> +These two dynamic PMU creates kprobe or uprobe with perf_event_open and

There's some grammar problem with the piece "These two dynamic PMU
creates kprobe or uprobe" which makes the sentence hard to understand.
Unfortunately, I cannot suggest a fix, because I'm bot sure what
you want to say. Could you explain further what you mean with this 
sentence please.

Cheers,

Michael

> +attaches it to the file descriptor.
> +See fields
> +.IR kprobe_func ", " uprobe_path ", " kprobe_addr ", and " probe_offset
> +for more details.
>  .RE
>  .TP
>  .I "size"
> @@ -627,6 +638,45 @@ then leave
>  .I config
>  set to zero.
>  Its parameters are set in other places.
> +.PP
> +If
> +.I type
> +is
> +.BR kprobe
> +or
> +.BR uprobe ,
> +set
> +.IR retprobe
> +(bit 0 of
> +.IR config ,
> +see /sys/bus/event_source/devices/[k,u]probe/format/retprobe)
> +for kretprobe/uretprobe. See fields
> +.IR kprobe_func ", " uprobe_path ", " kprobe_addr ", and " probe_offset
> +for more details.
> +.RE
> +.TP
> +.IR kprobe_func ", " uprobe_path ", " kprobe_addr ", and " probe_offset
> +.EE
> +These fields describes the kprobe/uprobe for dynamic PMU
> +.BR kprobe
> +and
> +.BR uprobe .
> +For
> +.BR kprobe ": "
> +use
> +.I kprobe_func
> +and
> +.IR probe_offset ,
> +or use
> +.I kprobe_addr
> +and leave
> +.I kprobe_func
> +as NULL. For
> +.BR uprobe ": "
> +use
> +.I uprobe_path
> +and
> +.IR probe_offset .
>  .RE
>  .TP
>  .IR sample_period ", " sample_freq
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
