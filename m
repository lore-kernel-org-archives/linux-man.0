From: Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
Subject: Re: OFD locks and deadlock detection
Date: Mon, 19 May 2014 10:28:02 -0400
Message-ID: <20140519102802.16dee141@tlielax.poochiereds.net>
References: <537A0495.60107@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537A0495.60107-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 19 May 2014 15:18:13 +0200
"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Jeff,
> 
> I just happened to notice :
> 
>     commit 57b65325fe34ec4c917bc4e555144b4a94d9e1f7
>     Author: Jeff Layton <jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>     Date:   Mon Feb 3 12:13:09 2014 -0500
> 
>         locks: skip deadlock detection on FL_FILE_PVT locks
> 
> And then this thread:
> 
>     http://thread.gmane.org/gmane.linux.file-systems/81318/focus=81327
>     From: Jeff Layton <jlayton <at> redhat.com>
>     Subject: [PATCH v5 13/14] locks: skip deadlock detection on FL_FILE_PVT locks
>     Date: 2014-01-09 14:19:46 GMT
> 
> I think it's pretty important to document that. All implementations
> of traditional process-associated (.k.a. "POSIX") locks that I've ever 
> come across do detect deadlocks, so it's important to note that OFD locks 
> do not.
> 
> I plan to add the following text to the fcntl(2) page:
> 
> [[
> In the current implementation,
> no deadlock detection is performed for open file description locks.
> (This contrasts with process-associated record locks,
> for which the kernel does perform deadlock detection.)
> ]]
> 
> Okay?
> 
> cheers,
> 
> Michael
> 
> 

(note: I'm no longer with Red Hat, so jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org no longer works)

Sounds fine to me.

FWIW, the deadlock detection for process-associated record locks is
pretty worthless except in certain narrow circumstances.

At some point, we probably should have a discussion as to whether
deadlock detection is really something we want to keep. The current
implementation requires a global spinlock which has obvious
consequences for scalability.

Thanks,
-- 
Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
