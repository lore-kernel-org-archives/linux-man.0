From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: capabilities(7): notes for kernel developers
Date: Fri, 16 Dec 2016 16:04:02 +0100
Message-ID: <1928427a-d29b-e625-37a0-52e9ffecc7e1@gmail.com>
References: <cdbc35f2-925e-aa65-98e7-a4ae4a5ded2c@gmail.com>
 <edb66332-86c9-6122-85c5-f856309cbfc1@schaufler-ca.com>
 <43dcc6dc-265b-5eaf-3a70-701e05200b9f@gmail.com>
 <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7@schaufler-ca.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ed6371f-3d38-45b1-a85b-1fbb3e5b4fc7-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Casey Schaufler <casey-iSGtlc1asvQWG2LlvL+J4A@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-security-module <linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/15/2016 09:40 PM, Casey Schaufler wrote:
> On 12/15/2016 11:41 AM, Michael Kerrisk (man-pages) wrote:
>> Hello Casey,
>>
>> On 12/15/2016 05:29 PM, Casey Schaufler wrote:
>>> On 12/15/2016 3:40 AM, Michael Kerrisk (man-pages) wrote:

[...]

>>>>        *  To determine which existing capability might best be associated
>>>>           with your new feature, review the list of capabilities above in
>>>>           order to find a "silo" into which your new feature best fits.
>>> One approach to take is to determine if there are other features
>>> requiring capabilities that will always be use along with the
>>> new feature. If the new feature is useless without these other
>>> features, you should use the same capability as the other features.
>> Thanks, I've lifted those words exactly as you gave them into the man page.
>>
>>>>        *  Don't choose CAP_SYS_ADMIN if you can  possibly  avoid  it!   A
>>>>           vast  proportion  of  existing capability checks are associated
>>>>           with this capability, to the point where it  can  plausibly  be
>>>>           called "the new root".  Don't make the problem worse.  The only
>>>>           new features that should be associated with  CAP_SYS_ADMIN  are
>>>>           ones that closely match existing uses in that silo.
>>> I don't agree with this advice. Use CAP_SYS_ADMIN if you are
>>> preforming system administration functions. Odds are very good
>>> that if a program is using one system administration feature
>>> it will be using others. 
>> Really? To me, the CAP_SYS_ADMIN situation is a terrible mess.  Around a
>> third of all of the capability checks in the kernel are for that
>> capability. Or, to put it another way, it is so broad, that if a process
>> has to have that capability, it may as well be root.  And because it is
>> so broad, the number of binaries that might need that file capability is
>> large. (See also https://lwn.net/Articles/486306/)
> 
> Back in the days of the POSIX P1003.1e/2c working group
> we struggled with what to do about the things that required
> privilege but that were not related to the enforcement of
> security policy. Everyone involved was looking to use
> capabilities to meet B2* least privilege requirements in
> NSA security evaluations. Because those evaluations where
> of security policy, by far the easiest thing to do was to
> create a single capability for all the things that didn't
> show up in the security policy and declare that the people
> doing the evaluation didn't have to look over there. Since
> then, people have taken a more practical view that includes
> security relevance in addition to security policy.

Ahhh -- thanks for a bit of the history! Helps me to
understand a bit more why things are as they are...

> In retrospect we should have grouped all of the attribute
> changes (chmod, chown, ...) into one capability and broken
> the non-policy actions into a set on 2 or three.
> 
> The way that we think of privilege has evolved. We're not
> focused on policy the way we used to be. We'll never get
> everyone to agree on what the *right* granularity and
> grouping is, either.

:-)

> -----
> * The B2 least privilege requirements are amusing.
>   If you want more information, look up "TCSEC orange book".

Maybe one day...

[...]

Cheers,

Mcihael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
