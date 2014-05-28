From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] locale.5: document glibc conventions regarding days and
 week
Date: Wed, 28 May 2014 18:15:24 +0300
Message-ID: <5385FD8C.2060400@redhat.com>
References: <5382D64A.9020404@redhat.com> <CAKgNAkivXL4KwJoL9ZzEoc91zMx2sonKh=8ZV22Waa8BrWf6bQ@mail.gmail.com> <5385F087.2060602@redhat.com> <CAKgNAki4FD=2wJG+5bEqD7v7Q4ZD-2aOtRrQJEiBWKT2S2mMEA@mail.gmail.com> <5385F92F.5040301@redhat.com> <CAKgNAki=f8trD6a0DMV8SPJzQYFgSY1=5XsaVmVvvbDoFXX2QQ@mail.gmail.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAki=f8trD6a0DMV8SPJzQYFgSY1=5XsaVmVvvbDoFXX2QQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-locales-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-05-28 18:03, Michael Kerrisk (man-pages) wrote:
> On Wed, May 28, 2014 at 4:56 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> On 2014-05-28 17:30, Michael Kerrisk (man-pages) wrote:
>>> On Wed, May 28, 2014 at 4:19 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>> On 2014-05-28 14:54, Michael Kerrisk (man-pages) wrote:
>>>>>
>>>>> Looking at this patch more closely, there's a piece that seems to be broken.
>>>>>
>>>>> That sentence is garbled. Some words are missing, I think. Can you clarify?
>>>>
>>>> it was clumsy indeed, and also repetitive, I don't think it's needed at all
>>>> as the previous paragraph already explains the same thing.
>>>>
>>>> Please see an updated and rebased patch below.
>>>
>>> Best just to tell me what needs to be dropped from the preceding
>>> patch, since I've already merged and edited in a private branch.
>>
>> best to drop the sentence that was garbled. I'll double check it once it
>> appears in a public branch.
> 
> Done. And now the changes are published in Git.

thanks, looks good, I'd add this tiny change to be explicit rather than implicit.

>From 4d8d8552aaf67f56278d1d8b90c88e531bfd111e Mon Sep 17 00:00:00 2001
From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Wed, 28 May 2014 18:11:55 +0300
Subject: [PATCH] locale.5: minor NOTES clarification

---
 man5/locale.5 |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index d762858..572833d 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -1079,10 +1079,12 @@ Usual default path for locale definition files.
 POSIX.2, ISO/IEC TR 14652.
 .SH NOTES
 The collective GNU C library community wisdom regarding
+.IR abday ,
 .IR day ,
 .IR week ,
+.IR first_weekday ,
 and
-.I first_weekday
+.I first_workday
 states at
 https://sourceware.org/glibc/wiki/Locales
 the following:
@@ -1090,13 +1092,17 @@ the following:
 The value of the second
 .I week
 list item specifies the base of the
+.I abday
+and
 .I day
-list.
+lists.
 .IP *
 .I first_weekday
 specifies the offset of the first day-of-week in the
+.I abday
+and
 .I day
-list.
+lists.
 .IP *
 For compatibility reasons, all glibc locales should set the value of the
 second
@@ -1104,8 +1110,10 @@ second
 list item to
 .B 19971130
 (Sunday) and base the
+.I abday
+and
 .I day
-list appropriately, and set
+lists appropriately, and set
 .I first_weekday
 to
 .B 1
-- 
1.7.1

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
