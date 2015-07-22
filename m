From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] mmap.2: document the munmap exception for underlying
 page size
Date: Wed, 22 Jul 2015 19:16:57 +0200
Message-ID: <55AFD009.6080706@gmail.com>
References: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <alpine.DEB.2.10.1507211736300.24133@chino.kir.corp.google.com>
Sender: owner-linux-mm@kvack.org
To: David Rientjes <rientjes@google.com>
Cc: mtk.manpages@gmail.com, Hugh Dickins <hughd@google.com>, Davide Libenzi <davidel@xmailserver.org>, Eric B Munson <emunson@akamai.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hi David,

On 07/22/2015 02:41 AM, David Rientjes wrote:
> munmap(2) will fail with an errno of EINVAL for hugetlb memory if the 
> length is not a multiple of the underlying page size.
> 
> Documentation/vm/hugetlbpage.txt was updated to specify this behavior 
> since Linux 4.1 in commit 80d6b94bd69a ("mm, doc: cleanup and clarify 
> munmap behavior for hugetlb memory").
> 
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  man2/mmap.2 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man2/mmap.2 b/man2/mmap.2
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -383,6 +383,10 @@ All pages containing a part
>  of the indicated range are unmapped, and subsequent references
>  to these pages will generate
>  .BR SIGSEGV .
> +An exception is when the underlying memory is not of the native page
> +size, such as hugetlb page sizes, whereas
> +.I length
> +must be a multiple of the underlying page size.
>  It is not an error if the
>  indicated range does not contain any mapped pages.
>  .SS Timestamps changes for file-backed mappings

I'm struggling a bit to understand your text. Is the point this:

    If we have a hugetlb area, then the munmap() length
    must be a multiple of the page size.

?

Are there any requirements about 'addr'? Must it also me huge-page-aligned?

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
