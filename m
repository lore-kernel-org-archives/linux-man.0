From: Craig Howland <howland-ZkbvEYpuQwKSe5ORCPIMD9BPR1lH4CV8@public.gmane.org>
Subject: random(3) man page error
Date: Wed, 23 Mar 2016 15:20:29 -0400
Message-ID: <56F2EC7D.6010108@LGSInnovations.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man3/random.3.html contains an error with 
respect to the feature test macro requirements.

It says "_XOPEN_SOURCE >= 500
                || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE"

However, the POSIX-related requirement is not complete.  According to POSIX, it 
originated in issue 4 as an X/OPEN UNIX extension (see 
http://pubs.opengroup.org/onlinepubs/9699919799/functions/random.html), and was 
moved to BASE in issue 5.  The GLIBC 2.12 on my RHEL6 system do seem to gate it 
as POSIX says (see clips below), so it is only the man page in error.

So the man page really should say "_XOPEN_SOURCE >= 500
                || _XOPEN_SOURCE_EXTENDED  && _XOPEN_SOURCE
                || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                || /* Glibc versions <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE"
(I'm not totally certain of the right way for _XOPEN_SOURCE_EXTENDED to be used, 
but you get the idea.)

Now perhaps this extra line was purposely left out based on a statement in 
feature_test_macros(7) that says "since defining _XOPEN_SOURCE with a value of 
500 or more has the same effect as defining _XOPEN_SOURCE_EXTENDED, the latter 
(obsolete) feature test macro is generally not described in the SYNOPSIS in man 
pages." However, for this case it leaves out a user getting it with a version 
older than 500.  (The manual as-is is good for a new user, really, but it is not 
good for a developer working on the proper gates in the code, or a user looking 
at older code.)

Craig Howland

Supporting information:

 From stdlib.h;
#if defined __USE_SVID || defined __USE_XOPEN_EXTENDED || defined __USE_BSD
...
extern long int random (void) __THROW;

 From features.h:
#ifdef  _XOPEN_SOURCE
# define __USE_XOPEN    1
# if (_XOPEN_SOURCE - 0) >= 500
#  define __USE_XOPEN_EXTENDED  1
#  ...
# else
#  ifdef _XOPEN_SOURCE_EXTENDED
#   define __USE_XOPEN_EXTENDED 1
...


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
