From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Fri, 30 May 2008 20:24:22 +0200
Message-ID: <cfd18e0f0805301124o5f217dden10726b268d05d81a@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com>
	 <E1K27bZ-0002Gk-3b@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1K27bZ-0002Gk-3b@pomaz-ex.szeredi.hu>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: drepper@redhat.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Miklos,

On Fri, May 30, 2008 at 6:37 PM, Miklos Szeredi <miklos@szeredi.hu> wrote:
>> Here's a further version of the patch, against 2.6.26rc2, with the
>> 2008-05-19 git changes you sent me applied.  This patch is based on
>> the draft patch you sent me.  I've tested this version of the patch,
>> and it works as for all cases except the one mentioned below.  But
>> note the following points:
>>
>> 1) I didn't make use of the code in notify_change() that checks
>> IS_IMMUTABLE() and IS_APPEND() (i.e., I did not add
>> ATTR_OWNER_CHECK to the mask in the controlling if statement).
>> Doing this can't easily be made to work for the
>> do_futimes() case without reworking the arguments passed to
>> notify_change().  Actually, I'm inclined to doubt whether it
>> is a good idea to try to roll that check into notify_change() --
>> at least for utimensat() it seems simpler to not do so.
>
> Ugh...  Could we just omit this part (the if !times and write error
> then check owner)?  I know it was my idea, but
>
>  a) my ideas are often stupid
>  b) one patch should ideally do just one thing
>
> After we fixed the original issue, we can still think about this other
> thing :)

Okay, by now quite a bit of my time has been wasted, and my patience
is starting to get a little thin.

I already fixed most of the isues with utimensat() in my previous
version of the patch several days back, and that patch (probably
still) applies against current mainline.  The one issue that wasn't
fixed by my earlier patch was the one below, which I've only just
today noticed.

>> 2) I've found yet another divergence from the spec -- but this
>> was in the original implementation, rather than being
>> something that has been introduced.  In do_futimes() there is
>>
>>         if (!times && !(file->f_mode & FMODE_WRITE))
>>                 write_error = -EACCES;
>>
>> However, the check here should not be against the f_mode (file access
>> mode), but the against actual permission of the file referred to by
>> the underlying descriptor.  This means that for the do_futimes() +
>> times==NULL case, a set-user-ID root program could open a file
>> descriptor O_RDWR/O_WRONLY for which the real UID does not have write
>> access, and then even after reverting the the effective UID, the real
>> user could still update file.
>
> Sure, but so could a write(2), so that doesn't seem such a big
> problem.
>
> I think we should leave it this way, since changing it would affect
> not just utimensat() and futimesat() but utime() and utimes() as well,
> which are well established, old interfaces.  Shanging them could in
> theory break userspace, which we try to avoid if possible.

It is a problem, because every portable user program that uses this
interfaces, and relies on this corner of behavior, will have to
special case for Linux.  Can you tell me one good reason why we should
do that?  (And preserving bugs because fixing them would break the ABI
is not a good reason.)

The relevant interfaces here are:

utimensat()
futimesat()
utime()
utimes()
futimens() -- because implemented in glibc via utimensat() with path==NULL.

* utime() and utimes() can't be affected by this point: they don't use
file descriptors.
* futimesat() doesn't matter: it is a non-standad interface that was
prematurely added to the kernel, and then promptly replaced with
utimensat().  No other OS will add this interface, and no-one will
ever use it on Linux.  Its manual page will very soon say as much.
* utimensat() and futimens() matter, because they are currently broken
on this point (as well as a number of others).

This is a bug.  It is one of *several* bugs in the original
implementation of the utimensat()/futimens() interface.  All of them
should be fixed.  I have by now provided fixes for most of them.  (Not
point 2 above, but with a little help that should be quickly fixed as
well.)  At this point, I think you need to explain why you think those
fixes shouldn't be applied.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
