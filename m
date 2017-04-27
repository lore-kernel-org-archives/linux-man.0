From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages 2/2] ioctl_userfaultfd.2: start adding details
 about userfaultfd features
Date: Thu, 27 Apr 2017 19:26:22 +0200
Message-ID: <063f52b3-ca66-8196-80f4-a1b7fac90de5@gmail.com>
References: <1493302474-4701-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493302474-4701-3-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493302474-4701-3-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 04/27/2017 04:14 PM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Thanks, Mike. Applied, and lightly edited.

All changes now pushed to Git.

Cheers,

Michael

> ---
>  man2/ioctl_userfaultfd.2 | 53 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> index 42bf7a7..cdc07e0 100644
> --- a/man2/ioctl_userfaultfd.2
> +++ b/man2/ioctl_userfaultfd.2
> @@ -121,22 +121,70 @@ and explicitly enable userfaultfd features that are disabled by default.
>  The kernel always reports all the available features in the
>  .I features
>  field.
> +
> +To enable userfaultfd features the application should set
> +a bit corresponding to each feature it wants to enable in the
> +.I features
> +field.
> +If the kernel supports all the requested features it will enable them.
> +Otherwise it will zero out the returned
> +.I uffdio_api
> +structure and return
> +.BR EINVAL .
>  .\" FIXME add more details about feature negotiation and enablement
>  
>  Since Linux 4.11, the following feature bits may be set:
>  .TP
>  .B UFFD_FEATURE_EVENT_FORK
> +When this feature is enabled,
> +the userfaultfd objects associated with a parent process are duplicated
> +into the child process during
> +.BR fork (2)
> +system call and the
> +.I UFFD_EVENT_FORK
> +is delivered to the userfaultfd monitor
>  .TP
>  .B UFFD_FEATURE_EVENT_REMAP
> +If this feature is enabled,
> +when the faulting process invokes
> +.BR mremap (2)
> +system call
> +the userfaultfd monitor will receive an event of type
> +.I UFFD_EVENT_REMAP.
>  .TP
>  .B UFFD_FEATURE_EVENT_REMOVE
> +If this feature is enabled,
> +when the faulting process calls
> +.BR madvise(2)
> +system call with
> +.I MADV_DONTNEED
> +or
> +.I MADV_REMOVE
> +advice to free a virtual memory area
> +the userfaultfd monitor will receive an event of type
> +.I UFFD_EVENT_REMOVE.
>  .TP
>  .B UFFD_FEATURE_EVENT_UNMAP
> +If this feature is enabled,
> +when the faulting process unmaps virtual memory either explicitly with
> +.BR munmap (2)
> +system call, or implicitly either during
> +.BR mmap (2)
> +or
> +.BR mremap (2)
> +system call,
> +the userfaultfd monitor will receive an event of type
> +.I UFFD_EVENT_UNMAP
>  .TP
>  .B UFFD_FEATURE_MISSING_HUGETLBFS
> +If this feature bit is set,
> +the kernel supports registering userfaultfd ranges on hugetlbfs
> +virtual memory areas
>  .TP
>  .B UFFD_FEATURE_MISSING_SHMEM
> -.\" FIXME add feature description
> +If this feature bit is set,
> +the kernel supports registering userfaultfd ranges on tmpfs
> +virtual memory areas
>  
>  The returned
>  .I ioctls
> @@ -182,7 +230,8 @@ The API version requested in the
>  .I api
>  field is not supported by this kernel, or the
>  .I features
> -field was not zero.
> +field passed to the kernel includes feature bits that are not supported
> +by the current kernel version.
>  .\" FIXME In the above error case, the returned 'uffdio_api' structure is
>  .\" zeroed out. Why is this done? This should be explained in the manual page.
>  .\"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
