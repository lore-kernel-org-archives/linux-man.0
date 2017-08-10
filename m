From: Lennart Poettering <lennart@poettering.net>
Subject: Re: [PATCH man-pages] open.2: improve O_PATH documentation.
Date: Thu, 10 Aug 2017 12:21:04 +0200
Message-ID: <20170810102104.GA16888@gardel-login>
References: <873790rtni.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <873790rtni.fsf@notabene.neil.brown.name>
Sender: linux-fsdevel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.com>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Do, 10.08.17 13:25, NeilBrown (neilb@suse.com) wrote:

> +If
> +.I pathname
> +refers to an automount point that has not yet been triggered, so no
> +other filesystem is mounted on it, then the call returns a file
> +descriptor referring to the automount directory without triggering a mount.
> +.BR fstatfs (2)
> +can then be used to determine if it is, in fact, an untriggered
> +automount point
> +.RB ( ".f_type == AUTOFS_SUPER_MAGIC" ).

Because Linux is broken you shouldn't compare f_type just like this,
and the man page probably shouldn't suggest that either I figure. The
only safe way is something like this:

     s.f_type == (typeof(s.f_type)) AUTOFS_SUPER_MAGIC

That's because f_type is defined with different types (both signed and
unsigned) on different archs, and the magic values tend to use the
full unsigned 32bit range...

(Yes, strictly speaking AUTOFS_SUPER_MAGIC isn't one of the unsigned
32bit ones, but I think it's better to stick the same rules for all
magic values comparisons here...)

(And yes, the statfs() man page only mentions the problem briefly,
without the typeof way out, but it really should)

Lennart

-- 
Lennart Poettering, Red Hat
