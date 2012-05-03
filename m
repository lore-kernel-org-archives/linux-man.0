From: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Thu, 03 May 2012 13:57:21 +0530
Message-ID: <87fwbhhdp2.fsf@skywalker.in.ibm.com>
References: <1335669917-23970-1-git-send-email-vapier@gentoo.org> <CAKgNAkgykZJV59WJXW9c9gVwXhn=WNYKxo_W1GM7ocHEEFqEXg@mail.gmail.com> <877gwxacti.fsf@skywalker.in.ibm.com> <20120430114410.GB28308@thunk.org>User-Agent: Notmuch/0.11.1+346~g13d19c3 (http://notmuchmail.org) Emacs/23.3.1 (x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120430114410.GB28308-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ted Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Ted Ts'o <tytso-3s7WtUTddSA@public.gmane.org> writes:

> It might also be a good idea to document explicitly whether or not
> things like fstat() and the syscalls to manipulate extended attributes
> are expected to work.
>

fstat won't work, but fstatat with an empty path name would work. O_PATH
descriptors are suppose to be used as "location only descriptors". 
We then extended the *at syscalls to work with EMPTY pathnames so that
O_PATH descriptors can be used with readlink, fchownat and fstatat().
This was done to enable us to do these operation on symlinks.
(65cfc6722361570bfe255698d9cd4dccaf47570d)

Examples for O_PATH and handle syscall can be found in qemu and
handle-test repo 

http://git.qemu.org/?p=qemu.git;a=blob;f=hw/9pfs/virtio-9p-handle.c;h=f96d17a9749a6f672741ff4dcb98da81d1dcc3ce;hb=HEAD
https://github.com/kvaneesh/handle-test/blob/master/handle.h

-aneesh

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
