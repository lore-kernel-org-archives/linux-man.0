From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RFC: capabilities(7): notes for kernel developers
Date: Thu, 15 Dec 2016 12:40:56 +0100
Message-ID: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, Casey Schaufler <casey-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org>, James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-security-module <linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

Because the topic every now then comes up "which capability 
should I associate with the new feature that I'm adding to 
the kernel?", I propose to add the text below to the 
capabilities(7) man page [1] with some recommendations
on how to go about choosing. I would be happy
to get feedback, suggestions for improvement and
so on.

Cheers,

Michael

[1] http://man7.org/linux/man-pages/man7/capabilities.7.html


   Notes to kernel developers
       When adding a new kernel feature that  should  be  governed  by  a
       capability, consider the following points.

       *  The  goal of capabilities is divide the power of superuser into
          small pieces, such that if a program that has  capabilities  is
          compromised, its power to do damage to the system would be much
          less than a similar set-user-ID-root program.

       *  You have the choice of either creating  a  new  capability  for
          your  new  feature,  or associating the feature with one of the
          existing capabilities.  Because the size of capability sets  is
          currently  limited to 64 bits, the latter option is preferable,
          unless there are compelling reasons to take the former option.

       *  To determine which existing capability might best be associated
          with your new feature, review the list of capabilities above in
          order to find a "silo" into which your new feature best fits.

       *  Don't choose CAP_SYS_ADMIN if you can  possibly  avoid  it!   A
          vast  proportion  of  existing capability checks are associated
          with this capability, to the point where it  can  plausibly  be
          called "the new root".  Don't make the problem worse.  The only
          new features that should be associated with  CAP_SYS_ADMIN  are
          ones that closely match existing uses in that silo.

       *  If  you have determined that it really is necessary to create a
          new capability for your feature, avoid making (and  naming)  it
          as  a "single-use" capability.  Thus, for example, the addition
          of the highly specific CAP_WAKE_ALARM was probably  a  mistake.
          Instead,  try  to  identify  and  name your new capability as a
          broader silo into which other related future  use  cases  might
          fit.


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
