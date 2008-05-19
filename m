From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes -- version 2
Date: Mon, 19 May 2008 14:24:37 +0200
Message-ID: <cfd18e0f0805190524w7d0e5a47s42cb2c469c26a262@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <482F38A1.9070704@gmail.com>
	 <E1Jy20a-0007pv-Ij@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1Jy20a-0007pv-Ij@pomaz-ex.szeredi.hu>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: drepper@redhat.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Miklos,

On Mon, May 19, 2008 at 11:50 AM, Miklos Szeredi <miklos@szeredi.hu> wrote:
>> Regarding your suggestions above, are you meaning something like the
>> patch below?
>
> Yes.
>
>> The patch is a little less pretty than I'd like because of the need to
>> return EACCES or EPERM depending on whether (times == NULL).  In
>> particular, these lines in utimes.c:
>>
>> +     if (!times && error == -EPERM)
>> +             error = -EACCES;
>>
>> seem a little fragile (but maybe I worry too much).
>
> It's not only fragile, it's ugly as sin.  I'd rather do it this way:
>
> - initialize error to zero
> - if no write access then set error, and the ATTR_TIMES_UPDATE(*) flag
> - set error2 from result of notify_change()
> - if error is zero then return error2, otherwise return error
>
> (*) I've been mulling over the name and perhaps ATTR_OWNER_CHECK would
> be better, or something that implies that it's not really about
> updating the times, but about checking the owner.

This all makes sense, but...

> Also could you do the patch against the
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git vfs-cleanups
>
> tree, which does big structural cleanups to do_utimes?

You keep moving the goalposts here...  First, it was provide an
obvious correct fix (for the non-conformances); then: can you cleanup
the owner checks; then: can you rewrite against my git tree...  My
time at the moment is fairly limited, and I have a problem: currently,
I'm not a git user.  That'll change soon, but I don't have the time to
change it now.  Can I just download a snapshot tarball of your git
changes somehwere?  Alternatively, when do you expect your changes to
make it into an rc?

Cheers,

Michael
