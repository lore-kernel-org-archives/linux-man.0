From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: user_namespace(7) man page
Date: Sat, 13 Sep 2014 19:58:32 -0700
Message-ID: <54150458.9060408@gmail.com>
References: <53F5310A.5080503@gmail.com> <CALCETrX2qwvzmeoVcLFLxEK=1Fv+f0Ri0TouzzvbN_rgDjka4A@mail.gmail.com> <540F0810.7030408@gmail.com> <87ppf4n5ib.fsf@x220.int.ebiederm.org> <CALCETrV4WizRXD9JuwibUBbQE9hhNrRDJ3cYyXdhd=OfPziF5g@mail.gmail.com> <5411B5F5.2090500@gmail.com> <CALCETrXOgCUrrzeJYJ6VoPgR5Rt0HFCrhRC0H7+3XLv1Y+sJ_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrXOgCUrrzeJYJ6VoPgR5Rt0HFCrhRC0H7+3XLv1Y+sJ_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, richard -rw- weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/11/2014 08:15 AM, Andy Lutomirski wrote:
> On Thu, Sep 11, 2014 at 7:47 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> So, in the current draft of the setns(2) page, there is
>>
>>     CLONE_NEWNS
>>         ...
>>         Since  Linux 3.9, CLONE_NEWUSER also automatically  implies
>>         CLONE_FS.
>>
>> Does that cover your point? Or did you mean that more needs to be said?
> 
> Looks good, although you could add CLONE_THREAD and the rest of the
> things implied by CLONE_THREAD if you want to be fancier.

Yes, under CLONE_NEWUSER there is also a statement that that flag 
implies CLONE_THREAD, and elsewhere in the page there is the
following text:

[[
       In addition, CLONE_THREAD, CLONE_SIGHAND, and CLONE_VM  can  be
       specified  in  flags if the caller is single threaded (i.e., it
       is not sharing  its  address  space  with  another  process  or
       thread).  In this case, these flags have no effect.  (Note also
       that specifying CLONE_THREAD  automatically  implies  CLONE_VM,
       and  specifying  CLONE_VM automatically implies CLONE_SIGHAND.)
       If the process is multithreaded, then the use  of  these  flags
       results in an error.
]]

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
