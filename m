From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 12:50:42 +0100
Message-ID: <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478768067.2642.23.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikos,

On 11/10/2016 09:54 AM, Nikos Mavrogiannopoulos wrote:
> On Wed, 2016-11-09 at 16:23 +0100, Michael Kerrisk (man-pages) wrote:
>> [I'm looping a few people into this mail who previously commented
>> on this page. Nikos, I will also thread you into an earlier mail 
>> by Laurent Georget.]
>>
>> Hello Nikos,
>>
>> Sorry that I have been so slow to follow up on this.
>> Thanks for your persistence. I have some comments 
>> that probably require some tweaks to your patch.
>> I also have some questions about a couple of other 
>> earlier discussions.
> 
> The comments should be addressed now (see inline for more info or the
> attached patch). I have not included my proposed fix for Laurent's
> issue (my proposal was to drop that text, though it can be done
> independent of this patch).
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=71211

Okay. I'll reply to that separately.

>> On 10/20/2016 10:37 AM, Nikos Mavrogiannopoulos wrote:
>>>
>>> On Mon, 2016-08-01 at 13:48 +0200, Nikos Mavrogiannopoulos wrote:
>>>>
>>>>>
>>>>> This is an updated patch reflecting the recent discussion in
>>>>> linux-
>>>>> crypto:
>>>>> http://www.mail-archive.com/linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg204
>>>>> 00.html
>>> Hi,
>>>  I'm resending the patch with few typo fixes, and adding Ted in CC
>>> for
>>> review. Ted would you like to review this patch for the random(4)
>>> manpage?
>>
>> Some comments below.
>>
>> But one question first. You didn't further reply to George 
>> Spelvin's comments on 26 April. Did you consider those comments
>> irrelevant or already addressed or something else?
> 
> I believe we disagree on some points with George (see other mail).
> 
>> By the way, inline patches are rather easier for me to deal with.
> 
> (sorry for the attachment, I have no figured a way to make my mailer
> send consistently the right data when inline)

Okay. But, have you read "MUA-SPECIFIC HINTS" in the 
git-format-patch(1) man page?

[...]

>>>  Since Linux 3.16,
>>>  .\" commit 79a8468747c5f95ed3d5ce8376a3e82e0c5857fc
>>>  a
>>> @@ -104,14 +108,11 @@ This means that it will impact the contents
>>>  read from both files, but it will not make reads from
>>>  \fI/dev/random\fP faster.
>>>  .SS Usage
>>> -If you are unsure about whether you should use
>>> +The 
>>>  .IR /dev/random
>>> -or
>>> +interface is considered a legacy interface, and
>>
>> I'm a little uncomfortable with the term "legacy". To me it implies 
>> that there is *no* legitimate use of /dev/random these days. I'm
>> no expert on randomness, but I wonder if that is true. Is it?
>> If it's not, then I would prefer simply a strong statement that
>> "/dev/urandom is preferred and sufficient in all use cases".
> 
> That's a tough one to handle. Yes /dev/urandom is preferred and
> sufficient in all use cases, with the exception of early boot time.
> More in the text. I've also added a section "KNOWN ISSUES" to state
> clearly that issue, and mention getrandom() early in the page.

Okay. I can go with your suggestion now, especially since Laurent 
also chimed in to agree with you.

>>>  If a seed file is saved across reboots as recommended below (all
>>> major
>>>  Linux distributions have done this since 2000 at least), the
>>> output is
>>> -- 2.7.4
>> Laurent Georget also commented on this page in a mail last year.
>> I'm going to thread you (and the other people on this mail) into
>> that mail discussion in case there's something there that you
>> might incorporate into a revised patch.
> 
> I think it was a different paragraph. Replied in the other email.

Okay.

I've applied your patch. Thanks for persisting with this.
After massaging the text a little, I have also applied 
the following wording fix, which I hope is okay:

===
diff --git a/man4/random.4 b/man4/random.4
index 0363dac..a0c10fa 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -46,8 +46,8 @@ When read, the
 .I /dev/urandom
 device returns random bytes using a pseudorandom
 number generator seeded from the entropy pool.
-That operation is non-blocking.
-When used during early boot time, this device may return
+Reads from this device are nonblocking.
+When read during early boot time, this device may return
 data prior to the entropy pool being initialized.
 If this is of concern in your application, use
 .BR getrandom (2)
@@ -331,7 +331,7 @@ which gets added to the entropy pool.
 Zero the entropy count of all pools and add some system data (such as
 wall clock) to the pools.
 .SH BUGS
-When used during early boot,
+During early boot time, reads from
 .I /dev/urandom
 may return data prior to the entropy pool being initialized.
 .SH FILES
====

The updates are currently sitting in a local branch on my machine
just in case we need more tweaks, but the patch will go out
with the next man-pages release.

Cheers,

Michael


=====
>From 652621c5601d788bd25cb05ee730e27f851e3b94 Mon Sep 17 00:00:00 2001
From: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Thu, 7 Apr 2016 09:08:14 +0200
Subject: [PATCH] Update the random(4) documentation towards a more accurate
 view on /dev/urandom

This documents the "property" of /dev/urandom of being able to serve numbers
prior to pool being initialized, and removes any suggested usages of /dev/random
which are disputable (i.e., one-time pad).
Document the fact /dev/random is a legacy interface and only suitable for
applications which can afford indeterminate delays since very few applications
can do so.

Signed-off-by: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man4/random.4 | 57 ++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/man4/random.4 b/man4/random.4
index b67c46f..8609b84 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -13,8 +13,6 @@
 .\" 2004-04-08, AEB, Improved description of read from /dev/urandom
 .\" 2008-06-20, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>,
 .\"             Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>
-.\"     Add a Usage subsection that recommends most users to use
-.\"     /dev/urandom, and emphasizes parsimonious usage of /dev/random.
 .\"
 .TH RANDOM 4 2016-10-08 "Linux" "Linux Programmer's Manual"
 .SH NAME
@@ -37,11 +35,26 @@ The generator also keeps an estimate of the
 number of bits of noise in the entropy pool.
 From this entropy pool random numbers are created.
 .LP
-When read, the \fI/dev/random\fP device will return random bytes
-only within the estimated number of bits of noise in the entropy
-pool.
-\fI/dev/random\fP should be suitable for uses that need very
-high quality randomness such as one-time pad or key generation.
+Linux 3.17 and later provides the simpler and safer (see below)
+.BR getrandom(2)
+interface which requires no special files.
+.LP
+When read, the \fI/dev/urandom\fP device return random bytes using a pseudorandom
+number generator seeded from the entropy pool. That operation is
+non-blocking. When used during early boot time, this device may return
+data prior to the entropy pool being initialized.
+If this is of concern in your application, use
+.BR getrandom(2)
+or \fI/dev/random\fP instead.
+
+.LP
+The \fI/dev/random\fP device is a legacy interface which dates back to
+a time where the cryptographic primitives used in the implementation
+of \fI/dev/urandom\fP were not widely trusted. It will return random bytes
+only within the estimated number of bits of fresh noise in the entropy
+pool, blocking if necessary.
+\fI/dev/random\fP is suitable for applications that need very
+high quality randomness, and can afford indeterminate delays.
 When the entropy pool is empty, reads from \fI/dev/random\fP will block
 until additional environmental noise is gathered.
 If
@@ -60,18 +73,8 @@ will return -1 and
 .I errno
 will be set to
 .BR EAGAIN .
-.LP
-A read from the \fI/dev/urandom\fP device will not block
-waiting for more entropy.
-If there is not sufficient entropy, a pseudorandom number generator is used
-to create the requested bytes.
-As a result, in this case the returned values are theoretically vulnerable to a
-cryptographic attack on the algorithms used by the driver.
-Knowledge of how to do this is not available in the current unclassified
-literature, but it is theoretically possible that such an attack may
-exist.
-If this is a concern in your application, use \fI/dev/random\fP
-instead.
+
+The flag
 .B O_NONBLOCK
 has no effect when opening
 .IR /dev/urandom .
@@ -104,14 +107,15 @@ This means that it will impact the contents
 read from both files, but it will not make reads from
 \fI/dev/random\fP faster.
 .SS Usage
-If you are unsure about whether you should use
+The
 .IR /dev/random
-or
+interface is considered a legacy interface, and
 .IR /dev/urandom ,
-then probably you want to use the latter.
-As a general rule,
-.IR /dev/urandom
-should be used for everything except long-lived GPG/SSL/SSH keys.
+is preferred and sufficient in all use cases, with the exception of
+applications which require randomness during early boot time; for
+these applications, the system call
+.BR getrandom(2)
+must be used instead, because will block until the entropy pool is initialized.
 
 If a seed file is saved across reboots as recommended below (all major
 Linux distributions have done this since 2000 at least), the output is
@@ -319,6 +323,9 @@ which gets added to the entropy pool.
 .BR RNDZAPENTCNT ", " RNDCLEARPOOL
 Zero the entropy count of all pools and add some system data (such as
 wall clock) to the pools.
+.SH KNOWN ISSUES
+When used during early boot, \fI/dev/urandom\fP may return data prior to the entropy pool being initialized.
+
 .SH FILES
 /dev/random
 .br
-- 

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
