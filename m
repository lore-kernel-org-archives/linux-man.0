From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Thu, 15 Dec 2016 12:40:02 -0800
Message-ID: <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
Sender: owner-linux-security-module@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, James Morris <jmorris@namei.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, John Stultz <john.stultz@linaro.org>, Jann Horn <jann@thejh.net>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-man <linux-man@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
> Hello Casey,
>
> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
>> On 12/15/2016 3:40 AM, Michael Kerrisk (man-pages) wrote:
>>> Hello all,
>>>
>>> Because the topic every now then comes up "which capability 
>>> should I associate with the new feature that I'm adding to 
>>> the kernel?", I propose to add the text below to the 
>>> capabilities(7) man page [1] with some recommendations
>>> on how to go about choosing. I would be happy
>>> to get feedback, suggestions for improvement and
>>> so on.
>> Thank you. This is long overdue.
>>
>>> Cheers,
>>>
>>> Michael
>>>
>>> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>>>
>>>
>>>    Notes to kernel developers
>>>        When adding a new kernel feature that  should  be  governed  by  a
>>>        capability, consider the following points.
>>>
>>>        *  The  goal of capabilities is divide the power of superuser into
>>>           small pieces, such that if a program that has  capabilities  is
>> I wouldn't say "small". Small implies many, and we want to
>> keep the number of capabilities manageable.
> Fixed.
>
>>>           compromised, its power to do damage to the system would be much
>>>           less than a similar set-user-ID-root program.
>> Not "much less", just less.
> Fixed.
>
>> Change "similar set-user-ID-root program" to "the same program
>> running with root privilege".
> Fixed.
>
>>>        *  You have the choice of either creating  a  new  capability  for
>>>           your  new  feature,  or associating the feature with one of the
>>>           existing capabilities.  Because the size of capability sets  is
>>>           currently  limited to 64 bits, the latter option is preferable,
>> The reason is not the size of the set being limited, it is
>> that a large set of capabilities would be unmanageable. The
>> fact that someone is reading this is sufficient evidence of
>> that.
> Yep. Reworked to cover this point.
>
>>>           unless there are compelling reasons to take the former option.
>>>
>>>        *  To determine which existing capability might best be associated
>>>           with your new feature, review the list of capabilities above in
>>>           order to find a "silo" into which your new feature best fits.
>> One approach to take is to determine if there are other features
>> requiring capabilities that will always be use along with the
>> new feature. If the new feature is useless without these other
>> features, you should use the same capability as the other features.
> Thanks, I've lifted those words exactly as you gave them into the man page.
>
>>>        *  Don't choose CAP_SYS_ADMIN if you can  possibly  avoid  it!   A
>>>           vast  proportion  of  existing capability checks are associated
>>>           with this capability, to the point where it  can  plausibly  be
>>>           called "the new root".  Don't make the problem worse.  The only
>>>           new features that should be associated with  CAP_SYS_ADMIN  are
>>>           ones that closely match existing uses in that silo.
>> I don't agree with this advice. Use CAP_SYS_ADMIN if you are
>> preforming system administration functions. Odds are very good
>> that if a program is using one system administration feature
>> it will be using others. 
> Really? To me, the CAP_SYS_ADMIN situation is a terrible mess.  Around a
> third of all of the capability checks in the kernel are for that
> capability. Or, to put it another way, it is so broad, that if a process
> has to have that capability, it may as well be root.  And because it is
> so broad, the number of binaries that might need that file capability is
> large. (See also https://lwn.net/Articles/486306/)

Back in the days of the POSIX P1003.1e/2c working group
we struggled with what to do about the things that required
privilege but that were not related to the enforcement of
security policy. Everyone involved was looking to use
capabilities to meet B2* least privilege requirements in
NSA security evaluations. Because those evaluations where
of security policy, by far the easiest thing to do was to
create a single capability for all the things that didn't
show up in the security policy and declare that the people
doing the evaluation didn't have to look over there. Since
then, people have taken a more practical view that includes
security relevance in addition to security policy.

In retrospect we should have grouped all of the attribute
changes (chmod, chown, ...) into one capability and broken
the non-policy actions into a set on 2 or three.

The way that we think of privilege has evolved. We're not
focused on policy the way we used to be. We'll never get
everyone to agree on what the *right* granularity and
grouping is, either.

-----
* The B2 least privilege requirements are amusing.
  If you want more information, look up "TCSEC orange book".

> Here's an *incomplete* list of (from capabilities(7)) of what
> CAP_SYS_ADMIN allows:
>
>   * Perform a range of system administration operations including:
>     quotactl(2),   mount(2),   umount(2),  swapon(2),  swapoff(2),
>     sethostname(2), and setdomainname(2);
>   * perform privileged syslog(2) operations (since  Linux  2.6.37,
>     CAP_SYSLOG should be used to permit such operations);
>   * perform VM86_REQUEST_IRQ vm86(2) command;
>   * perform  IPC_SET and IPC_RMID operations on arbitrary System V
>     IPC objects;
>   * override RLIMIT_NPROC resource limit;
>   * perform operations on trusted and security Extended Attributes
>     (see xattr(7));
>   * use lookup_dcookie(2);
>   * use  ioprio_set(2) to assign IOPRIO_CLASS_RT and (before Linux
>     2.6.25) IOPRIO_CLASS_IDLE I/O scheduling classes;
>   * forge PID when passing  socket  credentials  via  UNIX  domain
>     sockets;
>   * exceed  /proc/sys/fs/file-max,  the  system-wide  limit on the
>     number of open files, in system calls that open  files  (e.g.,
>     accept(2), execve(2), open(2), pipe(2));
>   * employ  CLONE_* flags that create new namespaces with clone(2)
>     and unshare(2) (but, since Linux 3.8, creating user namespaces
>     does not require any capability);
>   * call perf_event_open(2);
>   * access privileged perf event information;
>   * call  setns(2)  (requires  CAP_SYS_ADMIN  in the target names‐
>     pace);
>   * call fanotify_init(2);
>   * call bpf(2);
>   * perform privileged KEYCTL_CHOWN and  KEYCTL_SETPERM  keyctl(2)
>     operations;
>   * use ptrace(2) PTRACE_SECCOMP_GET_FILTER to dump a tracees sec‐
>     comp filters;
>   * perform madvise(2) MADV_HWPOISON operation;
>   * employ the TIOCSTI ioctl(2)  to  insert  characters  into  the
>     input  queue of a terminal other than the caller's controlling
>     terminal;
>   * employ the obsolete nfsservctl(2) system call;
>   * employ the obsolete bdflush(2) system call;
>   * perform various privileged block-device ioctl(2) operations;
>   * perform various privileged filesystem ioctl(2) operations;
>   * perform privileged  ioctl(2)  operations  on  the  /dev/random
>     device (see random(4));
>   * install  a  seccomp(2)  filter without first having to set the
>     no_new_privs thread attribute;
>   * modify allow/deny rules for device control groups.
>   * perform administrative operations on many device drivers.
>
> I'm not sure what subset of that you want to put under "system
> administration", but you'd have to be using a very broad definition
> indeed to include all of that. (In fact, I think one of the very
> problems with the capability is its name. Whereas most capabilities have
> task-related names, this one has a role-related name. I think that's not
> unconnected to the mess that this capability has become.)
>  
> So, in summary, I still think it's good advice, though it could perhaps
> be more nuanced. (I had attempted to do that with the sentence "The only
> new features that should be associated with CAP_SYS_ADMIN are ones that
> closely  match existing uses in that silo.") Still, I'm certainly open
> to hearing more argument on this point.
>
>>>        *  If  you have determined that it really is necessary to create a
>>>           new capability for your feature, avoid making (and  naming)  it
>>>           as  a "single-use" capability.
>> Be strong. Don't say "avoid making (and naming)", say "don't make or name".
>> We can't allow single use capabilities. If we did that we'd have thousands
>> of capabilities. It's hard enough to get developers to use a coarse set of
>> capabilities.
> Good advice re the wording. Thanks. Fixed.
>
>>>   Thus, for example, the addition
>>>           of the highly specific CAP_WAKE_ALARM was probably  a  mistake.
>>>           Instead,  try  to  identify  and  name your new capability as a
>>>           broader silo into which other related future  use  cases  might
>>>           fit.
>> Need a better example. 
> How about CAP_PACCT then?
>
>> CAP_WAKE_ALARM could readily be CAP_TIME.
> Actually, I don't quite understand what you mean with that sentence.
> Could you elaborate?

Should have said CAP_SYS_TIME

Setting an alarm could be considered a time management function,
depending on what it actually does.

>
> By now, the text reads:
>
>    Notes to kernel developers
>        When adding a new kernel feature that  should  be  governed  by  a
>        capability, consider the following points.
>
>        *  The  goal of capabilities is divide the power of superuser into
>           pieces, such that if a program that has one or  more  capabili‐
>           ties is compromised, its power to do damage to the system would
>           be less than the same program running with root privilege.
>
>        *  You have the choice of either creating  a  new  capability  for
>           your  new  feature,  or associating the feature with one of the
>           existing capabilities.  In order to keep the set  of  capabili‐
>           ties  to  a  manageable  size, the latter option is preferable,
>           unless there are compelling reasons to take the former  option.
>           (There  is  also a technical limit: the size of capability sets
>           is currently limited to 64 bits.)
>
>        *  To determine which existing capability might best be associated
>           with your new feature, review the list of capabilities above in
>           order to find a "silo" into which your new feature  best  fits.
>           One  approach  to  take is to determine if there are other fea‐
>           tures requiring capabilities that will always be use along with
>           the  new  feature.  If the new feature is useless without these
>           other features, you should use the same capability as the other
>           features.
>
>        *  Don't  choose  CAP_SYS_ADMIN  if  you can possibly avoid it!  A
>           vast proportion of existing capability  checks  are  associated
>           with  this  capability,  to the point where it can plausibly be
>           called "the new root".  Don't make the problem worse.  The only
>           new  features  that should be associated with CAP_SYS_ADMIN are
>           ones that closely match existing uses in that silo.
>
>        *  If you have determined that it really is necessary to create  a
>           new  capability  for  your  feature, don't make or name it as a
>           "single-use" capability.  Thus, for example,  the  addition  of
>           the highly specific CAP_PACCT was probably a mistake.  Instead,
>           try to identify and name your new capability as a broader  silo
>           into which other related future use cases might fit.
>
> Cheers,
>
> Michael
>

