From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: random(3) man page error
Date: Sat, 26 Mar 2016 09:13:26 +1300
Message-ID: <56F59BE6.30805@gmail.com>
References: <56F2EC7D.6010108@LGSInnovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2EC7D.6010108-ZkbvEYpuQwKSe5ORCPIMD9BPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Craig Howland <howland-ZkbvEYpuQwKSe5ORCPIMD9BPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Craig,

On 03/24/2016 08:20 AM, Craig Howland wrote:
> http://man7.org/linux/man-pages/man3/random.3.html contains an error with 
> respect to the feature test macro requirements.
> 
> It says "_XOPEN_SOURCE >= 500
>                 || /* Glibc since 2.19: */ _DEFAULT_SOURCE
>                 || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE"
> 
> However, the POSIX-related requirement is not complete.  According to POSIX, it 
> originated in issue 4 as an X/OPEN UNIX extension (see 
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/random.html), and was 
> moved to BASE in issue 5.  The GLIBC 2.12 on my RHEL6 system do seem to gate it 
> as POSIX says (see clips below), so it is only the man page in error.
> 
> So the man page really should say "_XOPEN_SOURCE >= 500
>                 || _XOPEN_SOURCE_EXTENDED  && _XOPEN_SOURCE
>                 || /* Glibc since 2.19: */ _DEFAULT_SOURCE
>                 || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE"
> (I'm not totally certain of the right way for _XOPEN_SOURCE_EXTENDED to be used, 
> but you get the idea.)

(Yes, what you show is technically accurate.)


> Now perhaps this extra line was purposely left out based on a statement in 
> feature_test_macros(7) that says "since defining _XOPEN_SOURCE with a value of 
> 500 or more has the same effect as defining _XOPEN_SOURCE_EXTENDED, the latter 
> (obsolete) feature test macro is generally not described in the SYNOPSIS in man 
> pages."

Yes. That is the reason. In the latest man-pages release (4.05), mention of
_XOPEN_SOURCE_EXTENDED was removed from virtually every man page.

> However, for this case it leaves out a user getting it with a version 
> older than 500.  (The manual as-is is good for a new user, really, but it is not 
> good for a developer working on the proper gates in the code, or a user looking 
> at older code.)

The problems here from my point of view are the following:

* Maintaining the FTM information is an arduous task, especially when
  one tries to maintain historical information also (which I do
  try to do).
* The FTM requirements shown in some man pages were growing very long. So long
  that they were an impediment to understanding in some cases.
* _XOPEN_SOURCE_EXTENDED is indeed understood still by glibc. However, that
  FTM was last documented in a standard in 1995. For a long time now, no new 
  code should have been trying to use it.
* Re the last point: continuing to mention _XOPEN_SOURCE_EXTENDED in the 
  man pages may actually mislead a few people into using that FTM!

The above is why I removed mention of _XOPEN_SOURCE_EXTENDED from the man
pages. It still seems like the right thing to do. If you have some strong
couterarguments, I'd be interested to hear them.

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
