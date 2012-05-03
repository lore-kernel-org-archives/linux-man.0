From: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Thu, 03 May 2012 19:34:35 +0530
Message-ID: <87bom5xswc.fsf@skywalker.in.ibm.com>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org> <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com> <877gwxacti.fsf@skywalker.in.ibm.com> <CAKgNAkiRH8p=Dp1tqkb3D9oRVCOSnj2bofgFN5x2svntN7vtPg@mail.gmail.com>User-Agent: Notmuch/0.11.1+346~g13d19c3 (http://notmuchmail.org) Emacs/23.3.1 (x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiRH8p=Dp1tqkb3D9oRVCOSnj2bofgFN5x2svntN7vtPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Aneesh,
>
>>
>> I don't know much about markers, but as per fsnotify_backend.h
>>
>> /*
>> =C2=A0* a mark is simply an object attached to an in core inode whic=
h allows an
>> =C2=A0* fsnotify listener to indicate they are either no longer inte=
rested in events
>> =C2=A0* of a type matching mask or only interested in those events.
>> =C2=A0*
>> =C2=A0* these are flushed when an inode is evicted from core and may=
 be flushed
>> =C2=A0* when the inode is modified (as seen by fsnotify_access). =C2=
=A0Some fsnotify users
>> =C2=A0* (such as dnotify) will flush these when the open fd is close=
d and not at
>> =C2=A0* inode eviction or modification.
>> =C2=A0*/
>> struct fsnotify_mark {
>
> Unfortunately, I'm still none the wiser about what this means for
> O_PATH file descriptors...
>

I looked at dnotify_flush, they remove markers on an inode.
But then it also checks for filp to match. So I am not sure
whether skipping dnotify_flush for O_PATH descriptor have any impact. W=
e
can't use O_PATH descriptor for dnotify fcntl any way. So in
dnotify_flush we will not match the filp.

Viro,

Any reason why we skip dnotify_flush  ?


-aneesh

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
