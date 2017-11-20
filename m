From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: [PATCH] ioctl_tty.2: add TIOCGPTPEER documentation
Date: Mon, 20 Nov 2017 11:06:28 -0600
Message-ID: <87zi7gq3qj.fsf@xmission.com>
References: <20170609170147.32311-1-asarai@suse.de>
        <11706e49-8271-ed8c-3747-19b3e8f2850d@gmail.com>
        <878tijwjic.fsf@xmission.com>
        <a7175aad-645c-8f86-d7cf-51f24f0bc281@suse.de>
        <87ziaztoxu.fsf@xmission.com>
        <c702b5c6-0098-4a61-f51c-c28ed085534f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c702b5c6-0098-4a61-f51c-c28ed085534f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael
        Kerrisk's message of "Mon, 20 Nov 2017 11:20:13 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Aleksa Sarai <asarai-l3A5Bk7waGM@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Christian Brauner <christian.brauner-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 08/16/2017 07:14 PM, Eric W. Biederman wrote:
>> Aleksa Sarai <asarai-l3A5Bk7waGM@public.gmane.org> writes:
>> 
>>>> A couple of things to note on the bigger picture.
>>>>
>>>> The glibc library on all distributions has been changed to not have a
>>>> setuid binary pt_chown, that uses ptsname.  This was the primary fix
>>>> for the security issue.
>>>>
>>>> The behavior of opening /dev/ptmx has been changed to perform a path
>>>> lookup relative to the location of /dev/ptmx of  ./pts/ptmx and open
>>>> it it is a devpts filesystem and to fail otherwise.    This further
>>>> makes it hard to confuse userspace this way as /dev/ptmx always
>>>> corresponds to /dev/pts/ptmx.  Even in chroots and in other mount
>>>> namespaces.
>>>
>>> I have a feeling that there might be a way to trick glibc if you use
>>> FUSE, but I haven't actually tried to create a PoC for it. Fair point
>>> though.
>> 
>> To trick glibc fuse would have to be mounted somewhere on /dev.
>> 
>>>> That makes TIOCGPTPEER a very nice addition, but not something people
>>>> have to scramble to use to ensure their system is secure.  As a hostile
>>>> environment now has to work very hard to confuse the existing mechanisms.
>>>
>>> There are usecases where you simply need TIOCGPTPEER, and no other
>>> userspace alternative will do, but maybe if we modified the paragraph
>>> to read (as suggested):
>>>
>>>   Security-conscious programs interacting with namespaces may
>>>   wish  to  use  this  operation rather than open(2) with the
>>>   pathname returned by ptsname(3).
>>>
>>> This would clarify that there are usecases where you need this
>>> particular feature, without saying causing people to panic over
>>> inaccurate claims of glibc being broken. Does that sound better?
>> 
>> I think your original words sounded fine.  I would even go for new
>> programs may want to use the new ioctl as it fundamentally less racy
>> and more of what is actually trying to be implemented with the userspace
>> pieces.
>> 
>> I just wanted to point out that TIOCGPTPEER while being the interface
>> that it would have been nice had we had since the beginning (and would
>> have avoided all of the problems) is actually not something we need to
>> scramble and use it is just a very nice to have.  As the immediate
>> issues have been fixed in other ways.    It was not clear to me from the
>> other discussions if you and Michael Kerrisk were aware of the
>> mitigations that had been made to address the security issue.
>
> So, my takeaway is that we leave this text:
>
>               Security-conscious programs interacting with namespaces may
>               wish  to  use  this  operation rather than open(2) with the
>               pathname returned by ptsname(3), and similar library  func‐
>               tions that have insecure APIs.  (For example, confusion can
>               occur in some cases using ptsname(3) with a pathname  where
>               a  devpts  filesystem has been mounted in a different mount
>               namespace.)
>
> as is?
>
>> The change to the behavior of /dev/ptmx may need to be documented
>> somewhere.   I am not certain if anything has been documented since
>> devpts has started allowing multiple mounts.
>
> Eric can you say more about this. When did this change occur?
> What is the model: mount devpts once in each mount namespace?


Let me replay things as best I can remember them.

Once upon a time pty's were ordinary dev entries, and posix_openpt
scoured around and found a pair of master/slave devices that were not
used and return those.  With a suid helper (pt_chown) grantpt changes the
permissions on the slave side.


This was in the days before udev and hotplug support in the kernel
and so had the disadvantage of having requiring someone to call mknod
in /dev for all possible ptys to be used before a pty could be created.

Following a posix draft /dev/ptmx and the devpts filesystem (expected to
be mounted at /dev/pts) were added.  The opening of /dev/ptmx creates a
slave entry in the devpts filesystem.  The devpts filesystem options
"uid", "gid", and "mode" existed since the beginning (2.1.93 ish) to
ensure that the newly created slave tty has the correct mode.

At which point the setuid granpt helper (pt_chown) should have begun the
process of retirement.

The weird quirk with devpts is that if it was mounted a secound
time you would get the same filesytem you mounted the first time, but
would have the opportunity to change the mount options.

As some uncareful scripts would mount devpts in a chroot without the
proper mount options in some distributions the pt_chown binary was kept
on not just for backwards compability but to keep the system working
after these weird scripts ran.  I believe one of them is
xen-image-builder.

Meanwhile in the land of containers and checkpoint/restart we wanted the
ability to migrate open ptys.  To do that we felt it was necessary to
preserve the major/minor numbers of the open ptys, so the migrated ptys
would have the same numbers.  Which resulted in devpts gaining the
"newinstance" mount option and a ptmx device node in 2.6.29.

To create a new slave in a mount of devpts mounted with "newinstance" it
was necessary to open /dev/pts/ptmx which in practice was bind mounted
or symlinked to /dev/ptmx to create a new pty.  This solved things
for containers.

Lurking in the background was setuid helper for grantpt (pt_chown) which
would not go away because of silly chrooted scripts that do things
wrong.

The addition of "newinstance" and user namespaces made it possible for
an mischievous person to mount devpts without privilege and open a pty
and pass that back to glibc and ask it to call granpt on it.  At which
point glibc would be confused and ask pt_chown to chown the same
numbered pty in the local instance of devpts.  As the attacker could
completely control the pty number this had the potential for a lot of
mischief.

At the end of the day this wound up with 3 fixes.
- Distributions stopped shipping pt_chown.
- The devpts "newinstance" mount option was made to always apply in 4.7,
  ensuring the mount options of devpts would not affect other mounts,
  and thus removing the need for pt_chown.
- The TIOCGPTPEER ioctl was added which if used carefully makes it
  impossible to confused glibc.

To make "newinstance" always apply to devpts without breaking any
existing distribution was interesting.  The problem was the /dev/ptmx
device node, which was fine when there was only one instance of devpts.

When the "newinstance" mount option was added a specific devpts instance
was mounted kernel internal and was used for /dev/ptmx for backwards
compatiblity.  Which worked at the time.   With "newinstance" always
creating a new instance of devpts that definition did not work.

We examined just having /dev/ptmx point to the first mount of devpts but
that fails on distributions like CentOS6 that mount devpts in the initrd
and then again from fstab.  We examined having devtmpfs create ptmx as a
symlink to pts/ptmx, but that fails on distributions like slackware that
don't mount devtmpfs.  What did work was to have /dev/ptmx perform a
relative path based lookup of "pts" in the same directory as the "ptmx"
device node.  That works for the weird distros like CentOS6 and the
weird chroot images that call mknod /dev/ptmx and mount devpts
themselves.  Plus it works for all of the normal cases.

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
