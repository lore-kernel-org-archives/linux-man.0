From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] maps.2: fd for a file mapping must be opened for reading
Date: Fri, 04 Apr 2014 13:27:33 +0200
Message-ID: <533E9725.90708@gmail.com>
References: <1396599875-10562-1-git-send-email-avagin@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1396599875-10562-1-git-send-email-avagin@openvz.org>
Sender: owner-linux-mm@kvack.org
To: Andrey Vagin <avagin@openvz.org>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-man@vger.kernel.org

On 04/04/2014 10:24 AM, Andrey Vagin wrote:
> Here is no difference between MAP_SHARED and MAP_PRIVATE.

Thanks, Andrey. That man page text has been there for a very long time,
but but does not seem to correspond to the truth in any kernel version
going back even to Linux 1.0. Patch applied.

Cheers,

Michael


> do_mmap_pgoff()
> 	switch (flags & MAP_TYPE) {
> 	case MAP_SHARED:
> 	...
> 	/* fall through */
> 	case MAP_PRIVATE:
> 		if (!(file->f_mode & FMODE_READ))
> 			return -EACCES;
> 
> Signed-off-by: Andrey Vagin <avagin@openvz.org>
> ---
>  man2/mmap.2 | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index c0fd321..b469f84 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -393,9 +393,7 @@ is set (probably to
>  .TP
>  .B EACCES
>  A file descriptor refers to a non-regular file.
> -Or
> -.B MAP_PRIVATE
> -was requested, but
> +Or a file mapping was requested, but
>  .I fd
>  is not open for reading.
>  Or
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
