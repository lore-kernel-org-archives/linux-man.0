From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/1] listxattr.2: provide example code
Date: Tue, 10 Feb 2015 07:17:10 +0100
Message-ID: <54D9A266.5090506@gmail.com>
References: <1423508278-4853-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423508278-4853-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich

Thanks for the revision. Please see comments below.

On 02/09/2015 07:57 PM, Heinrich Schuchardt wrote:
> An example code is provided for listxattr and getxattr.
> 
> Changes from version 1:
> 
> As Michael correctly pointed out, the buffer length returned by
> listxattr does not contain any byte after the 0x00 indicating
> the end of the last list entry.
> 
> Furthermore getxattr does not append 0x00.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/listxattr.2 | 141 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/listxattr.2 b/man2/listxattr.2
> index a67592f..3fa6d20 100644
> --- a/man2/listxattr.2
> +++ b/man2/listxattr.2
> @@ -1,5 +1,6 @@
>  .\" Copyright (C) Andreas Gruenbacher, February 2001
>  .\" Copyright (C) Silicon Graphics Inc, September 2001
> +.\" Copyright (C) 2015 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>  .\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>  .\" This is free documentation; you can redistribute it and/or
> @@ -22,7 +23,7 @@
>  .\" <http://www.gnu.org/licenses/>.
>  .\" %%%LICENSE_END
>  .\"
> -.TH LISTXATTR 2 2014-02-06 "Linux" "Linux Programmer's Manual"
> +.TH LISTXATTR 2 2015-02-09 "Linux" "Linux Programmer's Manual"

(No need to update the timestamp these days; my scripts do 
it automatically)

>  .SH NAME
>  listxattr, llistxattr, flistxattr \- list extended attribute names
>  .SH SYNOPSIS
> @@ -150,6 +151,144 @@ These system calls are Linux-specific.
>  .\" and the SGI XFS development team,
>  .\" .RI < linux-xfs-VZNHf3L845pBDgjK7y7TUQ@public.gmane.org >.
>  .\" Please send any bug reports or comments to these addresses.
> +.SH EXAMPLE
> +The following program demonstrates the usage of
> +.BR listxattr ()
> +and
> +.BR getxattr (2).
> +For a path provided, it lists all extended file attributes and their values.
> +
> +The following output was recorded when first creating a file, setting
> +some extended file attributes, and then listing them with the example code.
> +
> +.SS Example output
> +.in +4n
> +.nf
> +$ touch /tmp/foo
> +$ setfattr -n user.fred -v chocolate /tmp/foo
> +$ setfattr -n user.frieda -v bar /tmp/foo
> +$ setfattr -n user.empty /tmp/foo
> +$ ./listxattr /tmp/foo
> +user.fred: chocolate
> +user.frieda: bar
> +user.empty: <no value>
> +.fi
> +.in
> +.SS Program source
> +.nf
> +#include <malloc.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <attr/xattr.h>
> +#include <sys/types.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    ssize_t keylen, vallen;
> +    char *key, *p, *val;
> +    int i;

'i' is unused.

> +
> +    if (argc != 2) {
> +        fprintf(stderr, "usage: %s path\\n", argv[0]);

s/u/U/

> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * determine the length of the buffer needed

I think it's a little better to begin each comment with a capitalized word.

> +     */
> +    keylen = listxattr(argv[1], NULL, 0);
> +    if (keylen == \-1) {
> +        perror("listxattr");
> +        exit(EXIT_FAILURE);
> +    }
> +    if (keylen == 0) {
> +        printf("%s has no attibutes.\\n", argv[1]);
> +        exit(EXIT_SUCCESS);
> +    }
> +
> +    /*
> +     * allocate the buffer
> +     */
> +    key = malloc(keylen);
> +    if (key == NULL) {
> +        perror("malloc");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * copy the attribute list to the buffer
> +     */
> +    keylen = listxattr(argv[1], key, keylen);
> +    if (keylen == \-1) {
> +        perror("listxattr");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * The end of the list is marked by zero terminated string
> +     * of length zero.
> +     */

I think the above comment is stale, no?

> +    p = key;
> +    while (keylen > 0) {
> +
> +        /*
> +         * output attribute name
> +         */
> +        printf("%s: ", p);
> +
> +        /*
> +         * determine length of value
> +         */
> +        vallen = getxattr(argv[1], p, NULL, 0);
> +        if (vallen == \-1)
> +            perror("getxattr");
> +
> +        if (vallen > 0) {
> +            /*
> +             * allocate value buffer
> +             * one extra byte to append 0x00
> +             */
> +            ++vallen;
> +            val = malloc(vallen);

Replace two previous lines with

val = malloc(vallen + 1);

> +            if (val == NULL) {
> +                perror("malloc");
> +                exit(EXIT_FAILURE);
> +            }
> +
> +            /*
> +             * read value to buffer
> +             */
> +            vallen = getxattr(argv[1], p, val, vallen);
> +            if (vallen == \-1)
> +                perror("getxattr");
> +            else {
> +                /*
> +                 * output attribute value
> +                 */
> +                val[vallen] = 0;
> +                printf("%s", val);
> +            }
> +
> +            free(val);
> +        } else
> +            printf("<no value>");
> +
> +        printf("\\n");
> +
> +        /*
> +         *forward to next attribute name
> +         */

Here, I really think it would help readability to just take strlen()
pf 'p', and then use that to adjust 'p' and 'keylen'. I puzzled over 
this a few seconds wondering if there were off-by-one errors.

> +        while(*++p)
> +            \-\-keylen;
> +        ++p;
> +        keylen \-= 2;
> +    }
> +
> +    free(key);
> +    exit(EXIT_SUCCESS);
> +}

One further general point, which you need not do anything about,
but might choose to. You use the 'len==0' technique to estimate
the required buffer sizes. That's good. But of course the values
in each case could increase by the time of the second call. One *could*
implement looping logic that retries (to some loop count limit) 
the listxattr() and getxattr() calls in the case of an ERANGE error.

> +.fi
>  .SH SEE ALSO
>  .BR getfattr (1),
>  .BR setfattr (1),

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
