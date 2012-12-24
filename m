From: Justin Lebar <justin.lebar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: statm's "shared" field refers to pages backed by files.
Date: Mon, 24 Dec 2012 14:54:45 -0500
Message-ID: <CAFWcpZ60uxqiK_XX6TsLaeX+aPJ621i3+fQx7jsp8Bs1m67LGQ@mail.gmail.com>
References: <CAFWcpZ4sa=MhzOF8MPHUiq+__xgJkdBYTstAeTd5Q=_bZrNn+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFWcpZ4sa=MhzOF8MPHUiq+__xgJkdBYTstAeTd5Q=_bZrNn+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all.

It doesn't look like this change was committed.

Is there something I need to do here?  I'm not familiar with the
manpages project, so please let me know if I'm missing something
obvious.

Regards,
-Justin

On Wed, Oct 31, 2012 at 5:06 PM, Justin Lebar <justin.lebar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I noticed that statm's "shared" field doesn't match the sum of all the
> "shared" entries in smaps [1].
>
> The kernel docs explain that statm's "shared" field is "number of
> pages that are shared (i.e. backed by a file)" [2].  smaps appears to
> call a page shared if it's mapped by at least two processes, which
> explains this discrepancy.
>
> I'm not a kernel hacker, but it appears to me they do mean "i.e." and
> not "e.g." in the statm description: In
> fs/proc/task_mmu.c::task_statm, I see
>
>     *shared = get_mm_counter(mm, MM_FILEPAGES);
>
> Here's a patch which updates the man page to match the (hopefully
> correct) kernel docs.
>
> Subject: [PATCH] proc.5: statm's "shared" field refers to pages backed by
>  files.
>
> ---
>  man5/proc.5 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 88af7c5..855a2e0 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -947,7 +947,7 @@ size       total program size
>             (same as VmSize in \fI/proc/[pid]/status\fP)
>  resident   resident set size
>             (same as VmRSS in \fI/proc/[pid]/status\fP)
> -share      shared pages (from shared mappings)
> +share      shared pages (i.e., backed by a file)
>  text       text (code)
>  .\" (not including libs; broken, includes data segment)
>  lib        library (unused in Linux 2.6)
> --
> 1.7.10.4
>
> I've also attached the patch in case gmail messes it up somehow.
>
> -Justin
>
> [1] https://bugzilla.mozilla.org/show_bug.cgi?id=807181
> [2] http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/filesystems/proc.txt;h=a1793d670cd01bd374eddf54ffdfc768504291ff;hb=HEAD
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
