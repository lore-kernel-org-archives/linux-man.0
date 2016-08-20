From: Ursache Vladimir <f35f22fan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: readlink() example sometimes fails
Date: Sat, 20 Aug 2016 10:57:17 +0300
Message-ID: <CAJbVpmxJWuuO9-z=pavdnQh4ou0piJ72LK-T5fzt2QkJ+WZaAg@mail.gmail.com>
References: <CAJbVpmwRAi1dEJw=zUtsJLE2RRMGtsjqBJk4x+_KsJGWnoRsMA@mail.gmail.com>
 <28d2728c-e43c-dd90-3beb-fac899646ded@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <28d2728c-e43c-dd90-3beb-fac899646ded-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Seems fine, works for me, thank you.

On Sat, Aug 20, 2016 at 6:32 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Vladimir,
>
> On 08/18/2016 05:30 PM, Ursache Vladimir wrote:
>>  Hi,
>> the readlink() example from:
>>
>> http://man7.org/linux/man-pages/man2/readlink.2.html
>>
>> relies on lstat()'s st_size, but that doesn't work for files contents
>> created dynamically by the Linux kernel which often report a zero
>> size, for example the link at:
>> /sys/block/sda
>>
>> the example code will fail because stat.st_size reports zero and you
>> try to read (stat.st_size + 1) which will succeed, which will generate
>> the error : "symlink increased in size between lstat() and
>> readlink()".
>>
>> Somewhat related, the same issue is true for reading regular text
>> files, e.g: "/proc/filesystems" which will report stat.st_size = 0.
>>
>> My quick workaround:
>>
>> if (stat.st_size != 0)
>>     // work as usual
>> else if (file_is_a_link)
>>     // malloc 4K of ram and try to readlink() into it
>> else if (is_regular_file)
>>     // read() into a byte array that grows accordingly
>>
>> In case it matters, I'm using Ubuntu 16.04 amd64.
>
> Thanks for this report. I agree that the page needs to be fixed.
> I modified the example program to be as follows:
>
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <limits.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
>
> int
> main(int argc, char *argv[])
> {
>     struct stat sb;
>     char *linkname;
>     ssize_t r, bufsiz;
>
>     if (argc != 2) {
>         fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
>         exit(EXIT_FAILURE);
>     }
>
>     if (lstat(argv[1], &sb) == -1) {
>         perror("lstat");
>         exit(EXIT_FAILURE);
>     }
>
>     bufsiz = sb.st_size + 1;
>
>     /* Some magic symlinks under (for example) /proc and /sys
>        report 'st_size' as zero. In that case, take PATH_MAX as
>        a "good enough" estimate */
>
>     if (sb.st_size == 0)
>         bufsiz = PATH_MAX;
>
>     printf("%zd\n", bufsiz);
>
>     linkname = malloc(bufsiz);
>     if (linkname == NULL) {
>         perror("malloc");
>         exit(EXIT_FAILURE);
>     }
>
>     r = readlink(argv[1], linkname, bufsiz);
>     if (r == -1) {
>         perror("readlink");
>         exit(EXIT_FAILURE);
>     }
>
>     linkname[r] = '\0';
>
>     printf("'%s' points to '%s'\n", argv[1], linkname);
>
>     if (r == bufsiz)
>         printf("(Returned buffer may have been truncated)\n");
>
>     free(linkname);
>     exit(EXIT_SUCCESS);
> }
>
> Seem okay?
>
> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
