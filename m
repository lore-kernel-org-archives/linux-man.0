From: Leonardo Boiko <leoboiko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: suggestion: ANSI color codes manpage
Date: Thu, 25 Feb 2010 11:10:42 -0300
Message-ID: <3756413b1002250610i3f5ead7cw4e74771c3de58d0f@mail.gmail.com>
References: <3756413b1002241248o7e9a65b4q6b9c73bc8d3451f6@mail.gmail.com>
	 <20100224215615.GE19115@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100224215615.GE19115-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Ok, I think I fixed most of the problems.  A revised version is at
the same URL, http://namakajiri.net/code/ansicolors.7 (beware of
caching).


> It is also worth noting that blinking is commonly unimplemented

Out of curiosity, I did a quick test in Linux:

terminal          bold  italic    underline  blink,s   blink,r  negative
------------------------------------------------------------------------
console           ok    fgcolor   fgcolor    bgcolor   none     ok
console+screen    ok    negative  fgcolor    bgcolor   none     ok
urxvt             ok    ok        ok         ok        slow     ok
urxvt+screen      ok    negative  ok         ok        none     ok
xterm             ok    none      ok         ok        none     ok
kterm             ok    none      ok         bold      none     ok
gnome-terminal    ok    none      ok         none      none     ok
xfce4-terminal    ok    none      ok         none      none     ok
mlterm            ok    none      ok         none      none     ok
Eterm             ok    none      ok         bgcolor+  none     ok
                                             underline

I changed the wording to reflect these results (and removed "blink,
rapid" since it cannot possibly be considered a "common escape
sequence").  The attributes table was getting too cumbersome and hard
to fit in 80 columns, so I moved the information about implementation
fallbacks to NOTES.

I'd like to try the BSD consoles and OSX, but I don't have any
available.  I suppose the manpage would be mostly used by people using
the Linux console or X terminal emulators anyway.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
