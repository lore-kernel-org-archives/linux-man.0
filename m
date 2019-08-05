From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: pivot_root(".", ".") and the fchdir() dance
Date: Mon, 5 Aug 2019 14:29:21 +0200
Message-ID: <3a96c631-6595-b75e-f6a7-db703bf89bcf@gmail.com>
References: <CAKgNAki0bR5zZr+kp_xjq+bNUky6-F+s2ep+jnR0YrjHhNMB1g@mail.gmail.com>
 <20190805103630.tu4kytsbi5evfrhi@mikami>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805103630.tu4kytsbi5evfrhi@mikami>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aleksa Sarai <asarai@suse.de>
Cc: mtk.manpages@gmail.com, "Serge E. Hallyn" <serge@hallyn.com>, linux-man <linux-man@vger.kernel.org>, Containers <containers@lists.linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>, Jordan Ogas <jogas@lanl.gov>, Al Viro <viro@ftp.linux.org.uk>, werner@almesberger.net
List-Id: linux-man@vger.kernel.org

[CC += Werner Almesberger, original author of both the system call 
and the manual page.]

Hello Aleksa,

Thank you for your responses. See below.

On 8/5/19 12:36 PM, Aleksa Sarai wrote:
> On 2019-08-01, Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> wrote:
>> I'd like to add some documentation about the pivot_root(".", ".")
>> idea, but I have a doubt/question. In the lxc_pivot_root() code we
>> have these steps
>>
>>         oldroot = open("/", O_DIRECTORY | O_RDONLY | O_CLOEXEC);
>>         newroot = open(rootfs, O_DIRECTORY | O_RDONLY | O_CLOEXEC);
>>
>>         fchdir(newroot);
>>         pivot_root(".", ".");
>>
>>         fchdir(oldroot);      // ****
> 
> This one is "required" because (as the pivot_root(2) man page states),
> it's technically not guaranteed by the kernel that the process's cwd
> will be the same after pivot_root(2):
> 
>> pivot_root() may or may not change the current root and the current
>> working directory of any processes or threads which use the old root
>> directory.
>
> 
> Now, if it turns out that we can rely on the current behaviour (and the
> man page you're improving is actually inaccurate on this point) then
> you're right that this fchdir(2) isn't required.

I'm not sure that I follow your logic here. In the old manual page
text that you quote above, it says that [pivot_root() may change the
CWD of any processes that use the old root directory]. Two points 
there:

(1) the first fchdir() has *already* changed the CWD of the calling
process to the new root directory, and 

(2) the manual page implied but did not explicitly say that the
CWD of processes using the old root may be changed *to the new root
directory* (rather than changed to some arbitrary location!);
presumably, omitting to mention that detail explicitly in the manual
page was an oversight, since that is indeed the kernel's behavior.

The point is, the manual page was written 19 years ago and has
barely been changed since then. Even at the time that the system
call was officially released (in Linux 2.4.0), the manual page was
already inaccurate in a number of details, since it was written 
about a year beforehand (during the 2.3 series), and the 
implementation already changed by the time of 2.4.0, but the manual
page was not changed then (or since, but I'm working on that).

The behavior has in practice always been (modulo the introduction
of mount namespaces in 2001/2002):

       pivot_root()  changes  the root directory and the current
       working directory of each process or thread in  the  same
       mount namespace to new_root if they point to the old root
       directory.

Given that this has been the behavior since Linux 2.4.0 was
released, it improbable that this will ever change, since,
notwithstanding what the manual page says, this would be an ABI
breakage.

I hypothesize that the original manual page text, written before
the system call was even officially released, reflects Werner's
belief at the time that perhaps in the not too distant future
the implementation might change. But, 18 years on from 2.4.0,
it has not.

And arguably, the manual page should reflect that reality,
describing what the kernel actually does, rather than speculating
that things might (after 19 years) still sometime change.

>>         mount("", ".", "", MS_SLAVE | MS_REC, NULL);
>>         umount2(".", MNT_DETACH);
> 
>>         fchdir(newroot);      // ****
> 
> And this one is required because we are in @oldroot at this point, due
> to the first fchdir(2). If we don't have the first one, then switching
> from "." to "/" in the mount/umount2 calls should fix the issue.

See my notes above for why I therefore think that the second fchdir()
is also not needed (and therefore why switching from "." to "/" in the
mount()/umount2() calls is unnecessary.

Do you agree with my analysis?

> We do something very similar to this in runc as well[1] (though, as the
> commit message says, I "borrowed" the idea from LXC).
> 
> [1]: https://github.com/opencontainers/runc/commit/f8e6b5af5e120ab7599885bd13a932d970ccc748

Yep -- I saw your code as well, which in fact was what led me back
to the source of the idea in LXC (so, thanks for commenting the
origin of the idea).

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
