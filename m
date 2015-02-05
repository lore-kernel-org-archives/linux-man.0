From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] migrate_pages.2: add EFAULT/EINVAL errors
Date: Thu, 05 Feb 2015 13:27:24 +0100
Message-ID: <54D361AC.6000609@gmail.com>
References: <6cd7930b9e00b18176837431ad6185c490256dfb.1343299362.git.jstancek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6cd7930b9e00b18176837431ad6185c490256dfb.1343299362.git.jstancek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Stancek <jstancek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/26/2012 12:51 PM, Jan Stancek wrote:
> migrate_pages(2) can return also EFAULT and EINVAL errors.

Applied. Thanks, Jan.

Cheers,

Michael


> I encountered these errors while writing testcase for migrate_pages
> syscall for LTP (Linux test project).
> 
> I checked stable kernel tree 3.5 to see which paths return these.
> Both can be returned from get_nodes(), which is called from:
> SYSCALL_DEFINE4(migrate_pages, pid_t, pid, unsigned long, maxnode,
>                 const unsigned long __user *, old_nodes,
>                 const unsigned long __user *, new_nodes)
> 
> The testcase does following:
> EFAULT
> a) old_nodes/new_nodes is area mmaped with PROT_NONE
> b) old_nodes/new_nodes is area not mmapped in process address space,
>    -1 or area that has been just munmmaped
> 
> EINVAL
> a) maxnodes overflows kernel limit
> b) new_nodes contain node, which has no memory or does not exist or is
>    not returned for get_mempolicy(MPOL_F_MEMS_ALLOWED).
> 
> Signed-off-by: Jan Stancek <jstancek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/migrate_pages.2 |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
> 
> diff --git a/man2/migrate_pages.2 b/man2/migrate_pages.2
> index 416a569..0493459 100644
> --- a/man2/migrate_pages.2
> +++ b/man2/migrate_pages.2
> @@ -106,6 +106,32 @@ to access the specified target nodes.
>  No process matching
>  .I pid
>  could be found.
> +.TP
> +.B EFAULT
> +Part or all of the memory range specified by
> +.I old_nodes
> +/
> +.I new_nodes
> +and
> +.I maxnode
> +points outside your accessible address space.
> +.TP
> +.B EINVAL
> +The value specified by
> +.I maxnode
> +exceeds a kernel-imposed limit.
> +.\" As at 3.5, this limit is "a page worth of bits", e.g.,
> +.\" 8 * 4096 bits, assuming a 4kB page size.
> +Or,
> +.I old_nodes
> +/
> +.I new_nodes
> +specifies one or more node IDs that are
> +greater than the maximum supported node ID.
> +Or, none of the node IDs specified by
> +.I new_nodes
> +are on-line and allowed by the process's current cpuset context,
> +or none of the specified nodes contain memory.
>  .\" FIXME There are other errors
>  .SH VERSIONS
>  The
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
