From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mallinfo.3: Fix the example
Date: Thu, 5 Oct 2017 20:36:27 +0200
Message-ID: <15ca2c02-e6d6-8344-913f-203e5f02c3ee@gmail.com>
References: <20171003160622.6157-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003160622.6157-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jakub

On 10/03/2017 06:06 PM, Jakub Wilk wrote:
> Remove reference to non-standard "tlpi_hdr.h" and replace calls to
> functions that were declared in this header.

Ooops.I messed up there. The surprising thing
is that no-one else reported this in 6 years!
Anyway, thank! Patch applied.

Cheers,

Michael

> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man3/mallinfo.3 | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/mallinfo.3 b/man3/mallinfo.3
> index 64d40e62c..628373a16 100644
> --- a/man3/mallinfo.3
> +++ b/man3/mallinfo.3
> @@ -230,7 +230,8 @@ Topmost releasable block (keepcost):   31168
>  \&
>  .EX
>  #include <malloc.h>
> -#include "tlpi_hdr.h"
> +#include <stdlib.h>
> +#include <string.h>
>  
>  static void
>  display_mallinfo(void)
> @@ -259,9 +260,11 @@ main(int argc, char *argv[])
>      int numBlocks, j, freeBegin, freeEnd, freeStep;
>      size_t blockSize;
>  
> -    if (argc < 3 || strcmp(argv[1], "\-\-help") == 0)
> -        usageErr("%s num\-blocks block\-size [free\-step [start\-free "
> -                "[end\-free]]]\\n", argv[0]);
> +    if (argc < 3 || strcmp(argv[1], "\-\-help") == 0) {
> +        fprintf(stderr, "%s num\-blocks block\-size [free\-step "
> +                "[start\-free [end\-free]]]\\n", argv[0]);
> +        exit(EXIT_FAILURE);
> +    }
>  
>      numBlocks = atoi(argv[1]);
>      blockSize = atoi(argv[2]);
> @@ -273,12 +276,16 @@ main(int argc, char *argv[])
>      display_mallinfo();
>  
>      for (j = 0; j < numBlocks; j++) {
> -        if (numBlocks >= MAX_ALLOCS)
> -            fatal("Too many allocations");
> +        if (numBlocks >= MAX_ALLOCS) {
> +            fprintf(stderr, "Too many allocations\\n");
> +            exit(EXIT_FAILURE);
> +        }
>  
>          alloc[j] = malloc(blockSize);
> -        if (alloc[j] == NULL)
> -            errExit("malloc");
> +        if (alloc[j] == NULL) {
> +            perror("malloc");
> +            exit(EXIT_FAILURE);
> +        }
>      }
>  
>      printf("\\n============== After allocating blocks ==============\\n");
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
