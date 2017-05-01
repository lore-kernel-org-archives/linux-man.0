From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages 4/5] userfaultfd.2: add note about asynchronios
 events delivery
Date: Mon, 1 May 2017 20:33:45 +0200
Message-ID: <5fb9e169-5d92-2fe8-cc59-5c68cfb6be72@gmail.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493617399-20897-5-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-5-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Thanks. Applied. One question below.

> ---
>  man2/userfaultfd.2 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man2/userfaultfd.2 b/man2/userfaultfd.2
> index 8b89162..f177bba 100644
> --- a/man2/userfaultfd.2
> +++ b/man2/userfaultfd.2
> @@ -112,6 +112,18 @@ created for the child process,
>  which allows userfaultfd monitor to perform user-space paging
>  for the child process.
>  
> +Unlike page faults which have to be synchronous and require
> +explicit or implicit wakeup,
> +all other events are delivered asynchronously and
> +the non-cooperative process resumes execution as
> +soon as manager executes
> +.BR read(2).
> +The userfaultfd manager should carefully synchronize calls
> +to UFFDIO_COPY with the events processing.
> +
> +The current asynchronous model of the event delivery is optimal for
> +single threaded non-cooperative userfaultfd manager implementations.

The preceding paragraph feels incomplete. It seems like you want to make
a point with that last sentence, but the point is not explicit. What's
missing?

> +
>  .\" FIXME elaborate about non-cooperating mode, describe its limitations
>  .\" for kernels before 4.11, features added in 4.11
>  .\" and limitations remaining in 4.11
> 

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
