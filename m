From: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: Re: [PATCH[V2] 4/5] tzset.3: Add Environment section
Date: Wed, 28 Jan 2015 18:52:22 -0500
Message-ID: <54C97636.4000201@gmx.com>
References: <54BAFE98.2090402@gmx.com> <54BC126E.1080904@gmx.com> <54C4F9E7.6090104@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C4F9E7.6090104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/25/2015 09:12 AM, Michael Kerrisk (man-pages) wrote:
>> Also not used is:
>> /usr/share/zoneinfo/posixrules
>>
>> STEPS TO REPRODUCE NO posixrules:
>>
>> TZ=EST+5EDT,M1.3.0/2,M10.5.0/2 date
>> Sun Jan 18 14:01:24 EDT 2015
>> TZ=EST+5EDT,M1.4.0/2,M10.5.0/2 date
>> Sun Jan 18 13:01:27 EST 2015
> 
> Two questions:
> * I need some help with the shell output above. How does
>   it demonstrate that posixrules is not used?
> * Are you sure about this? A cursory grep through the 
>   glibc source shows instances of the string "posixrules".
>   See also the zic(8) man page.

Good catch Michael, I was indeed wrong. I based my position on the
following information from the zoneinfo Makefile:

# (When a POSIX-style environment variable is handled, the rules in the
# template file are used to determine "spring forward" and "fall back" days and
# times; the environment variable itself specifies UT offsets of standard and
# summer time.)

As you correctly pointed out, I should have looked at what glibc is
doing, not zoneinfo. Upon reviewing the glibc source the poxsixrules are
being used for very specific TZ strings that can be represented as:

[:]stdoffsetdst[offset][,]

If anything follows the above string, even invalid data, posixrules will
not be used. Below is some shell output demonstrating this.

I've posted v3 of this patch that includes the posixrule file, and a new
patch that adds a description of the file.

In the process of reading the source I have found a few more
discrepancies in the man-page... I will address those later.

Thank you for the heads up on not nesting brackets in patch titles, and for
taking the time to review and commit my work.

PS: zic's -l and -p options are just a user convenience to create the
localtime and posixrules links in the zoneinfo directory. zic doesn't
actually use the posixrules file for compiling.

In this demo the posixrules file is hard linked to America/New_York.
Notice the change to standard time when it is used.

$ TZ="NZST-12:00:00NZDT-13:00:00,M10.1.0/02:00:00,M3.3.0/02:00:00" \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
Thu Jan 29 06:53:01 NZDT 2015

$ TZ="NZST-12:00:00NZDT-13:00:00,ANYTHING" \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
Thu Jan 29 06:53:35 NZDT 2015

$ TZ="NZST-12:00:00NZDT,ANYTHING" \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
Thu Jan 29 06:53:58 NZDT 2015

$ TZ="NZST-12:00:00NZDT-13:00:00," \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
open("/usr/share/zoneinfo/posixrules", O_RDONLY|O_CLOEXEC) = 3
Thu Jan 29 05:54:58 NZST 2015

$ TZ="NZST-12:00:00NZDT," \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
open("/usr/share/zoneinfo/posixrules", O_RDONLY|O_CLOEXEC) = 3
Thu Jan 29 05:55:13 NZST 2015

$ TZ="NZST-12:00:00NZDT" \
> strace -eopen date 2>&1 | grep -Ei 'posixrules|jan'
open("/usr/share/zoneinfo/posixrules", O_RDONLY|O_CLOEXEC) = 3
Thu Jan 29 05:55:30 NZST 2015

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
