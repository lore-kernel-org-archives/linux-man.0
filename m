From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 2 open has wrong size and unit for file triggering EOVERFLOW?
Date: Fri, 26 Sep 2014 07:31:08 +0200
Message-ID: <5424FA1C.9000904@gmail.com>
References: <CAH-HCWWWP0Gb8V0tcHEu-uwQK9hiOLSus88bwfa13jXyWQ6ovw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAH-HCWWWP0Gb8V0tcHEu-uwQK9hiOLSus88bwfa13jXyWQ6ovw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shriramana Sharma <samjnaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/25/2014 07:26 PM, Shriramana Sharma wrote:
> Hello. Please refer to
> http://man7.org/linux/man-pages/man2/open.2.html -- the paragraph
> under EOVERFLOW. It reads that -D_FILE_OFFSET_BITS=64 is required
> while compiling to access files under size (2<<31)-1 *bits*. This
> seems to be wrong on two counts: that the numerical value is (2<<30)-1
> and not (2<<31)-1, and that the unit should be bytes and not bits.
> Please see the following transcript from a Kubuntu Trusty 32 bit
> system on an ext3 filesystem:

Thanks, Shriramana,

You are of course quite right. The text should have said
"(1<<31) -1 bytes". I've fixed it now.

Thanks,

Michael



> $ cat test.c
> # include <stdio.h>
> int main () {
>         FILE * fp = fopen("toobigfile", "r");
>         if (fp) printf("Success\n"); else printf("Failure\n");
> }
> $ clang -o test test.c
> 
> Creating file of size (2<<30)-1 *bytes*:
> 
> $ truncate -s 2147483647 toobigfile
> 
> It opens fine:
> 
> $ strace -f -eopen ./test
> open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> open("/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> open("toobigfile", O_RDONLY)            = 3
> Success
> +++ exited with 0 +++
> 
> Increase it by one byte i.e. to (2<<30) bytes and it fails:
> 
> $ truncate -s 2147483648 toobigfile
> $ strace -f -eopen ./test
> open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> open("/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> open("toobigfile", O_RDONLY)            = -1 EOVERFLOW (Value too
> large for defined data type)
> Failure
> +++ exited with 0 +++
> 
> Compile the prog with the prescribed def and it succeeds:
> 
> $ clang -o test test.c -D_FILE_OFFSET_BITS=64
> $ strace -f -eopen ./test
> open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> open("/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> open("toobigfile", O_RDONLY|O_LARGEFILE) = 3
> Success
> +++ exited with 0 +++
> 
> This shows that the threshold is actually 2 GiB which is (2<<30)
> *bytes* and not (2<<31) *bits*. Note the difference in both the shift
> length and units.
> 
> Note also that (2<<31) bits is (2<<28) bytes which is just 512 MiB and
> certainly 32-bit apps can access 600 MiB files without special
> compilation flags.
> 
> If you find this correct, please update the manpage. If you find this
> incorrect, please inform me why. Thank you!
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
