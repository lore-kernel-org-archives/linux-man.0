From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: pid_namespaces(7) man page
Date: Mon, 4 Mar 2013 13:48:48 +0100
Message-ID: <CAKgNAkhyu6G_X5Smkq02a6GU7FcLQ1rR+e7f+KK4ruUy5-Z6AQ@mail.gmail.com>
References: <CAKgNAki=mUYuu_Ewhe7sjCmo+Dq2Vr+FZCixqNRaadcvAxtpFw@mail.gmail.com>
 <1362110504.15531.4@driftwood> <CAKgNAkgVKnhRT1Lpq4a_UdBKB+tn6XmWSDF2QJXG0aSLtNH6dg@mail.gmail.com>
 <1362369010.29250.3@driftwood> <876217olp0.fsf@xmission.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <876217olp0.fsf-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 4, 2013 at 5:03 AM, Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> writes:
>
>> On 03/01/2013 03:57:40 AM, Michael Kerrisk (man-pages) wrote:
>>> > And yet the glibc guys insist on #define
>>> GNU_GNU_GNU_ALL_HAIL_STALLMAN in
>>> > order to access this Linux-specific feature which has nothing
>>> whatsoever to
>>> > do with the FSF.
>>>
>>> This is a misunderstanding. _GNU_SOURCE is the standard way to expose
>>> Linux-specific functionality from POSIX header files.
>>
>> What standard? The Linux kernel is not, and never was, part of the GNU
>> project.
>
> Is the argument that there should be a _LINUX_SOURCE directive in glibc
> for this?
>
> Although come to think of it I can't imagine how <sched.h> is a POSIX
> header.  Last I looked it only had linux specific bits in it.  Which
> makes needing any kind of #define strange.

I think you may be thinking of the wrong sched.h. The glibc
/usr/include/sched.h declares many user-space functions from POSIX.


Cheers,

Mcihael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
