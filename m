From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 08:22:45 +0200
Message-ID: <CAKgNAki_8bOsuKTJLx3iMLeSvVXHo0bZf8zSUQ08RR7+D33xgQ@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <1364794429-20477-1-git-send-email-ch0.han@lge.com> <201304010213.06056.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010213.06056.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

On Mon, Apr 1, 2013 at 8:13 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 01 April 2013 01:33:49 Changhee Han wrote:
>> +Each architecture ABI has its own requirements on how system call
>> arguments are passed to the kernel. +For system calls that have a glibc
>> wrapper (i.g., most system calls) glibc handles the details of copy
>> arguments to the right registers in a manner suitable for the
>> architecture.
>
> these lines need to be wrapped
>
> "i.g." is incorrect ... you mean "i.e."
>
>> +However, when using
>> +.BR syscall ()
>> +to make a system call,
>> +the caller may need to handle architecture-dependent details.
>> +For example, on ARM architecture, a
>> +.I "long long"
>> +argument is considered to be 8-byte aligned and to be split into two
>> 4-byte arguments. +
>> +.BR readahead ()
>> +system call could be called like below in ARM architecture.
>
> this has nothing to do with alignment.  syscalls pass args via registers, and
> in the 32bit ARM port, registers are 32bits wide.  so in order to pass a 64bit
> value, you have to manually split it up.

So, I'm not familiar with all the details here. What is the purpose of
the '0' argument that precedes 'offset' then?

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
