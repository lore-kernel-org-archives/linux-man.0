From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/1] listxattr.2: provide example code
Date: Wed, 11 Feb 2015 12:14:05 +0100
Message-ID: <CAKgNAkh9i1OxMXzrursa6_ijFiJiQvTecNEan=vDyPhtWgQ36Q@mail.gmail.com>
References: <1423595466-6016-1-git-send-email-xypron.glpk@gmx.de> <1423602411-11916-1-git-send-email-xypron.glpk@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423602411-11916-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 10 February 2015 at 22:06, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> Example code is provided.
>
> Version 4:
>    Use #include <sys/xattr.h>


Thanks. Applied.

Cheers,

Michael


> Version 3:
>    Remove unused variable.
>    Use strlen instead of while(++p) to find end of string.
>    Rename some variables.
>    Correct comments.
>
> Version 2:
>
>   As Michael correctly pointed out, the buffer length returned by
>   listxattr does not contain any byte after the 0x00 indicating
>   the end of the last list entry.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/listxattr.2 | 142 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
>
> diff --git a/man2/listxattr.2 b/man2/listxattr.2
> index a67592f..5fd9ec7 100644
> --- a/man2/listxattr.2
> +++ b/man2/listxattr.2
> @@ -1,5 +1,6 @@
>  .\" Copyright (C) Andreas Gruenbacher, February 2001
>  .\" Copyright (C) Silicon Graphics Inc, September 2001
> +.\" Copyright (C) 2015 Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>  .\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
>  .\" This is free documentation; you can redistribute it and/or
> @@ -150,6 +151,147 @@ These system calls are Linux-specific.
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
> +To keep the code simple, the assumption is made that attribute keys and
> +values are constant during the runtime of the program.
> +A production program should expect and handle changes during the runtime.
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
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/xattr.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    ssize_t buflen, keylen, vallen;
> +    char *buf, *key, *val;
> +
> +    if (argc != 2) {
> +        fprintf(stderr, "Usage: %s path\\n", argv[0]);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * Determine the length of the buffer needed.
> +     */
> +    buflen = listxattr(argv[1], NULL, 0);
> +    if (buflen == \-1) {
> +        perror("listxattr");
> +        exit(EXIT_FAILURE);
> +    }
> +    if (buflen == 0) {
> +        printf("%s has no attibutes.\\n", argv[1]);
> +        exit(EXIT_SUCCESS);
> +    }
> +
> +    /*
> +     * Allocate the buffer.
> +     */
> +    buf = malloc(buflen);
> +    if (buf == NULL) {
> +        perror("malloc");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * Copy the list of attribute keys to the buffer.
> +     */
> +    buflen = listxattr(argv[1], buf, buflen);
> +    if (buflen == \-1) {
> +        perror("listxattr");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * Loop over the list of zero terminated strings with the attribute keys.
> +     * Use the remaining buffer length to determine the end of the list.
> +     */
> +    key = buf;
> +    while (buflen > 0) {
> +
> +        /*
> +         * Output attribute key.
> +         */
> +        printf("%s: ", key);
> +
> +        /*
> +         * Determine length of the value.
> +         */
> +        vallen = getxattr(argv[1], key, NULL, 0);
> +        if (vallen == \-1)
> +            perror("getxattr");
> +
> +        if (vallen > 0) {
> +
> +            /*
> +             * Allocate value buffer.
> +             * One extra byte is needed to append 0x00.
> +             */
> +            val = malloc(vallen + 1);
> +            if (val == NULL) {
> +                perror("malloc");
> +                exit(EXIT_FAILURE);
> +            }
> +
> +            /*
> +             * Copy value to buffer.
> +             */
> +            vallen = getxattr(argv[1], key, val, vallen);
> +            if (vallen == \-1)
> +                perror("getxattr");
> +            else {
> +                /*
> +                 * Output attribute value.
> +                 */
> +                val[vallen] = 0;
> +                printf("%s", val);
> +            }
> +
> +            free(val);
> +        } else if (vallen == 0)
> +            printf("<no value>");
> +
> +        printf("\\n");
> +
> +        /*
> +         * Forward to next attribute key.
> +         */
> +        keylen = strlen(key) + 1;
> +        buflen \-= keylen;
> +        key += keylen;
> +    }
> +
> +    free(buf);
> +    exit(EXIT_SUCCESS);
> +}
> +.fi
>  .SH SEE ALSO
>  .BR getfattr (1),
>  .BR setfattr (1),
> --
> 2.1.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
