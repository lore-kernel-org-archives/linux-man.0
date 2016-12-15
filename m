From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Thu, 15 Dec 2016 08:29:48 -0800
Message-ID: <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, James Morris <jmorris@namei.org>, Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, John Stultz <john.stultz@linaro.org>, Jann Horn <jann@thejh.net>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-man <linux-man@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

On 12/15/2016 3:40 AM, Michael Kerrisk (man-pages) wrote:
> Hello all,
>
> Because the topic every now then comes up "which capability 
> should I associate with the new feature that I'm adding to 
> the kernel?", I propose to add the text below to the 
> capabilities(7) man page [1] with some recommendations
> on how to go about choosing. I would be happy
> to get feedback, suggestions for improvement and
> so on.

Thank you. This is long overdue.

> Cheers,
>
> Michael
>
> [1] http://man7.org/linux/man-pages/man7/capabilities.7.html
>
>
>    Notes to kernel developers
>        When adding a new kernel feature that  should  be  governed  by  a
>        capability, consider the following points.
>
>        *  The  goal of capabilities is divide the power of superuser into
>           small pieces, such that if a program that has  capabilities  is

I wouldn't say "small". Small implies many, and we want to
keep the number of capabilities manageable.

>           compromised, its power to do damage to the system would be much
>           less than a similar set-user-ID-root program.

Not "much less", just less.
Change "similar set-user-ID-root program" to "the same program
running with root privilege".
 

>        *  You have the choice of either creating  a  new  capability  for
>           your  new  feature,  or associating the feature with one of the
>           existing capabilities.  Because the size of capability sets  is
>           currently  limited to 64 bits, the latter option is preferable,

The reason is not the size of the set being limited, it is
that a large set of capabilities would be unmanageable. The
fact that someone is reading this is sufficient evidence of
that.

>           unless there are compelling reasons to take the former option.
>
>        *  To determine which existing capability might best be associated
>           with your new feature, review the list of capabilities above in
>           order to find a "silo" into which your new feature best fits.

One approach to take is to determine if there are other features
requiring capabilities that will always be use along with the
new feature. If the new feature is useless without these other
features, you should use the same capability as the other features.

>        *  Don't choose CAP_SYS_ADMIN if you can  possibly  avoid  it!   A
>           vast  proportion  of  existing capability checks are associated
>           with this capability, to the point where it  can  plausibly  be
>           called "the new root".  Don't make the problem worse.  The only
>           new features that should be associated with  CAP_SYS_ADMIN  are
>           ones that closely match existing uses in that silo.

I don't agree with this advice. Use CAP_SYS_ADMIN if you are
preforming system administration functions. Odds are very good
that if a program is using one system administration feature
it will be using others. 

>        *  If  you have determined that it really is necessary to create a
>           new capability for your feature, avoid making (and  naming)  it
>           as  a "single-use" capability.

Be strong. Don't say "avoid making (and naming)", say "don't make or name".
We can't allow single use capabilities. If we did that we'd have thousands
of capabilities. It's hard enough to get developers to use a coarse set of
capabilities.

>   Thus, for example, the addition
>           of the highly specific CAP_WAKE_ALARM was probably  a  mistake.
>           Instead,  try  to  identify  and  name your new capability as a
>           broader silo into which other related future  use  cases  might
>           fit.

Need a better example. CAP_WAKE_ALARM could readily be CAP_TIME.
