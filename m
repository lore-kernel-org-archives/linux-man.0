From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages 1/5] ioctl_userfaultfd.2: update description of
 shared memory areas
Date: Mon, 1 May 2017 20:33:31 +0200
Message-ID: <7ec5dfc0-9d84-e142-bfaa-d96383acbee9@gmail.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493617399-20897-2-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-2-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Mike,

I've applied this patch, but  have a question.

On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> ---
>  man2/ioctl_userfaultfd.2 | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> index 889feb9..6edd396 100644
> --- a/man2/ioctl_userfaultfd.2
> +++ b/man2/ioctl_userfaultfd.2
> @@ -181,8 +181,17 @@ virtual memory areas
>  .TP
>  .B UFFD_FEATURE_MISSING_SHMEM
>  If this feature bit is set,
> -the kernel supports registering userfaultfd ranges on tmpfs
> -virtual memory areas
> +the kernel supports registering userfaultfd ranges on shared memory areas.
> +This includes all kernel shared memory APIs:
> +System V shared memory,
> +tmpfs,
> +/dev/zero,
> +.BR mmap(2)
> +with
> +.I MAP_SHARED
> +flag set,
> +.BR memfd_create (2),
> +etc.
>  
>  The returned
>  .I ioctls

Does the change in this patch represent a change that occurred in
Linux 4.11? If so, I think this needs to be said explicitly in the text.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
