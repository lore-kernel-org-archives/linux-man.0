From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mallopt.3: Document M_ARENA_TEST, and M_ARENA_MAX.
Date: Sun, 30 Aug 2015 05:06:21 -0700
Message-ID: <55E2F1BD.8050609@gmail.com>
References: <55DB40AE.7080405@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DB40AE.7080405-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 08/24/2015 09:05 AM, Carlos O'Donell wrote:
> In 2013 I brought up the discussion if M_ARENA_MAX and M_ARENA_TEST
> were public parameters:
> https://sourceware.org/ml/libc-alpha/2013-03/msg00376.html
> Consensus among Siddhesh and myself was that they should be public,
> and in fact they were already in the public header. Therefore there
> may already be applications uses these constants and expecting them
> to work. At best we could limit mallopt's acceptance of the options,
> but that seems like a bad solution that could lead to unexpected
> behaviour for user applications. A quick google search shows that
> there are packages relying on these constants to tune the glibc
> malloc implementation.
> 
> Since glibc 2.10 the M_ARENA_TEST and M_ARENA_MAX features have
> been part of the public interface with --enable-experimental-malloc.
> 
> Since glibc 2.15 the experimental allocator has been on by default
> and M_ARENA_TEST and M_ARENA_MAX have been more broadly used.
> 
> There are environment variables, without trailing underscore, that
> can also be used to adjust these values at runtime i.e.
> MALLOC_ARENA_MAX, and MALLOC_ARENA_TEST.
> 
> This change describes these two options in the mallopt man page
> along with their environment variables.
> 
> Tested with glibc master on x86_64 to verify it works as expected.
> Tested patch with linux man pages master.
> Please apply.

Applied. I made a number of small wording fix-uos, and put a couple
that I thought might be worth double checking in commitb72bd8d. Could
you take a look at that commit please (also pasted as a patch at the
foot of this mail).

Cheers,

Michael

diff --git a/man3/mallopt.3 b/man3/mallopt.3
index c09e801..fd41bf0 100644
--- a/man3/mallopt.3
+++ b/man3/mallopt.3
@@ -66,8 +66,8 @@ and since glibc 2.15 by default.
 In some versions of the allocator there was no limit on the number
 of created arenas (e.g., CentOS 5, RHEL 5).
 
-When running programs on newer glibc versions,
-these applications may exhibit high contention when accessing arenas.
+When employing newer glibc versions, applications may in
+some cases exhibit high contention when accessing arenas.
 In these cases, it may be beneficial to increase
 .B M_ARENA_MAX
 to match the number of threads.
@@ -79,7 +79,7 @@ This is the limit, in number of arenas created, at which the system
 configuration will be examined to evaluate a hard limit on the
 number of created arenas.
 The computed limit is implementation-defined
-and is usually a multiple of the number of available cores.
+and is usually a multiple of the number of available CPUs.
 Once the limit is computed, the result is final and constrains
 the total number of arenas.
 See


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
