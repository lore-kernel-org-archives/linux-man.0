From: Jesper Juhl <jj-IYz4IdjRLj0sV2N9l4h3zg@public.gmane.org>
Subject: Re: st_size of a symlink
Date: Mon, 23 Jul 2012 22:47:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1207232243110.1922@swampdragon.chaosbits.net>
References: <500D73FF.1070504@nod.at> <alpine.LNX.2.00.1207231959410.1922@swampdragon.chaosbits.net> <20120723202224.GH31729@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120723202224.GH31729-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 23 Jul 2012, Al Viro wrote:

> On Mon, Jul 23, 2012 at 08:09:14PM +0200, Jesper Juhl wrote:
> > So, from my point of view it looks like procfs is the one who has got it 
> > wrong.
> > We should probably fix that (IMVHO).
> 
> Fix it _how_?  

By returning the size as the number of bytes in the name the link is 
currently pointing at.

> Try to rename a binary you have running in a process.
> Or rename its cwd.  Or rename an opened file.  Watch the corresponding
> procfs symlink (still pointing to the swame object) change.  With
> no way to tell that some sucker had looked at st_size some time ago
> and might get surprised by the change.
> 
Sure, length's may change and an app needs to be prepared for that, but 
that's no reason to always return 0 (zero) for length for links in procfs.
We can do better and return the actual length of whatever the link is 
pointing to currently - just like other filesystems do.

> The fact is, st_size is just a useful hint for symlink target length.

Sure.

> It tells you the likely sufficient size of buffer.  There's a reason
> why readlink(2) returns what it returns; you *can't* rely on the
> earlier lstat() results or, for that matter, any prior information.

I know that. That's not the issue. The issue is that procfs *could* return 
more useful info than it does currently.

> If nothing else, I could rm that symlink and create a new one in
> the meanwhile.  You need to check what it had returned and deal with
> insufficient buffer size.

Of course.

>  By retrying readlink() with bigger buffer.
> With procfs there's just a few more ways the readlink() output can
> change, that's all.
> 
Still not a good reason to just return 0 IMHO.


-- 
Jesper Juhl <jj-IYz4IdjRLj0sV2N9l4h3zg@public.gmane.org>       http://www.chaosbits.net/
Don't top-post http://www.catb.org/jargon/html/T/top-post.html
Plain text mails only, please.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
