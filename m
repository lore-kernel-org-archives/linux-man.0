From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Sat, 5 May 2012 23:31:00 +1200
Message-ID: <CAKgNAkjmSUDU9yk1UX=fSeSZfH4kgoQTUg6YeidZ9-fsOfJKAQ@mail.gmail.com>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com>
 <877gwxacti.fsf@skywalker.in.ibm.com> <CAKgNAkiRH8p=Dp1tqkb3D9oRVCOSnj2bofgFN5x2svntN7vtPg@mail.gmail.com>
 <87bom5xswc.fsf@skywalker.in.ibm.com> <20120503141156.GP6871@ZenIV.linux.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120503141156.GP6871-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, May 4, 2012 at 2:11 AM, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org> wrote=
:
> On Thu, May 03, 2012 at 07:34:35PM +0530, Aneesh Kumar K.V wrote:
>
>> I looked at dnotify_flush, they remove markers on an inode.
>> But then it also checks for filp to match. So I am not sure
>> whether skipping dnotify_flush for O_PATH descriptor have any impact=
=2E We
>> can't use O_PATH descriptor for dnotify fcntl any way. So in
>> dnotify_flush we will not match the filp.
>>
>> Viro,
>>
>> Any reason why we skip dnotify_flush =A0?
>
> See your last sentence above - why bother finding the mark, scanning =
the
> list, etc. when we know that there won't be any matches?

So, am I correct to understand that O_PATH has no interaction with dnot=
ify?

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
