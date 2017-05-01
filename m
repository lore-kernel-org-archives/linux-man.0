From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages 2/5] ioctl_userfaultfd.2: UFFDIO_COPY: add
 ENOENT and ENOSPC description
Date: Mon, 1 May 2017 20:33:36 +0200
Message-ID: <d621f4e3-01bb-5213-be64-8253d84bddb5@gmail.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493617399-20897-3-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-3-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Thanks, Mike. Applied.

Cheers,

Michael


> ---
>  man2/ioctl_userfaultfd.2 | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> index 6edd396..e12b9de 100644
> --- a/man2/ioctl_userfaultfd.2
> +++ b/man2/ioctl_userfaultfd.2
> @@ -481,6 +481,19 @@ was invalid.
>  An invalid bit was specified in the
>  .IR mode
>  field.
> +.TP
> +.B ENOENT
> +(Since Linux 4.11)
> +The faulting process has changed
> +its virtual memory layout simultaneously with outstanding
> +.I UFFDIO_COPY
> +operation.
> +.TP
> +.B ENOSPC
> +(Since Linux 4.11)
> +The faulting process has exited at the time of
> +.I UFFDIO_COPY
> +operation.
>  .\"
>  .SS UFFDIO_ZEROPAGE
>  (Since Linux 4.3.)
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
