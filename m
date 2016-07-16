From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug in man page for CONSOLE_IOCTL(4) - KDGETMODE
Date: Sat, 16 Jul 2016 12:42:21 +0200
Message-ID: <5bc835d0-3655-20a5-63cd-21fd626d9578@gmail.com>
References: <CY4PR08MB24545EF98CC0E51D316D42019F340@CY4PR08MB2454.namprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CY4PR08MB24545EF98CC0E51D316D42019F340-kmME7I9TBuJ8DJgEqPetRZNArRD3w/9+vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Gassib <position0x45-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Chris

On 07/16/2016 05:11 AM, Chris Gassib wrote:
> Description:
> The manual entry for KDGETMODE specifies "argp points to a long which
> is set to one of the above values." At least on x86_64-bit Fedora24,
> the text should probably specify argp is an int (32-bit), rather than
> a long (64-bit).
>
> Repo:
> Open a file descriptor to the local console, and execute some code like the following:
>     long arg = -1;
>     if (-1 == ioctl(fd, KDGETMODE, &arg)) { return -1; }
>     printf("KDGETMODE: 0x%lx\n", arg);
>
> Now try this version:
>     int arg = -1;
>     if (-1 == ioctl(fd, KDGETMODE, &arg)) { return -1; }
>     printf("KDGETMODE: 0x%x\n", arg);
>
> Result:
> The first version gives this result:
> KDGETMODE: 0xffffffff00000001
>
> The second version gives this result:
> KDGETMODE: 0x1
>
> Expected:
> Either documentation incorrect, or the API is. One of them should be
> changed so they match, or perhaps the documentation should specify
> that it only applies to the 32-bit version.

Reading the source confirms your point, and it's the documentation that
should be fixed. I've made that change. Thanks for the report.

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
