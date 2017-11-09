From: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4] Document new seccomp interfaces in Linux 4.14
Date: Thu, 9 Nov 2017 10:10:18 -0800
Message-ID: <CAGXu5j+qU4mwkMXkvgpKqWDxWga18EvN1T_8uieWnOOcKnd1+A@mail.gmail.com>
References: <1508991102-13686-1-git-send-email-tyhicks@canonical.com> <f49ff3da-c53a-e185-d994-00bc89b6a126@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f49ff3da-c53a-e185-d994-00bc89b6a126-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tyler Hicks <tyhicks-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Nov 9, 2017 at 6:25 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Tyler,
>
> On 10/26/2017 06:11 AM, Tyler Hicks wrote:
>> This patchset adds documentation for most of the new user-facing features
>> (/proc interfaces, SECCOMP_GET_ACTION_AVAIL operation, SECCOMP_FILTER_FLAG_LOG
>> flag, SECCOMP_RET_LOG action) merged into Linux 4.14 (commit
>> c0a3a64e723324ae6dda53214061a71de63808c3). All of these features have something
>> to do with providing more flexible seccomp logging configuration except for the
>> SECCOMP_GET_ACTION_AVAIL operation.
>
> Thanks for this set! I've applied all of the patches, made a few very minor
> tweaks, and pushed to Git.
>
> But, I realize there's some pieces missing about audit logging.
> Would you be able/willing to write a patch for the seccomp(2)
> page describing the audit details?
>
>> The remaining undocumented changes in 4.14 involve SECCOMP_RET_KILL being
>> renamed to SECCOMP_RET_KILL_THREAD and the new SECCOMP_RET_KILL_PROCESS action.
>> As I understand it, Kees Cook will be documenting those changes.
>
> Kees, are you there ? ;-)

I am, I am. :) I'm drowning in other work, but this is still on my
list. Do you have a set schedule for the next man-pages release?

-Kees

>
> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
