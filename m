From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH man-pages 0/5] {ioctl_}userfaultfd.2: yet another update
Date: Mon, 1 May 2017 20:34:07 +0200
Message-ID: <352eee49-d6d1-3e82-a558-2341484c81f3@gmail.com>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: mtk.manpages@gmail.com, Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> Hi Michael,
> 
> These updates pretty much complete the coverage of 4.11 additions, IMHO.

Thanks for this, but we still await input from Andrea
on various points.

> Mike Rapoport (5):
>   ioctl_userfaultfd.2: update description of shared memory areas
>   ioctl_userfaultfd.2: UFFDIO_COPY: add ENOENT and ENOSPC description
>   ioctl_userfaultfd.2: add BUGS section
>   userfaultfd.2: add note about asynchronios events delivery
>   userfaultfd.2: update VERSIONS section with 4.11 chanegs
> 
>  man2/ioctl_userfaultfd.2 | 35 +++++++++++++++++++++++++++++++++--
>  man2/userfaultfd.2       | 15 +++++++++++++++
>  2 files changed, 48 insertions(+), 2 deletions(-)

I've applied all of the above, and done some light editing.

Could you please check my changes in the following commits:

5191c68806c8ac73fdc89586cde434d2766abb5c
265225c1e2311ae26ead116e6c8d2cedd46144fa

Thanks,

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
