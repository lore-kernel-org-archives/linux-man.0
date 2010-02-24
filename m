From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: suggestion: ANSI color codes manpage
Date: Wed, 24 Feb 2010 22:56:15 +0100
Message-ID: <20100224215615.GE19115@machine.or.cz>
References: <3756413b1002241248o7e9a65b4q6b9c73bc8d3451f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3756413b1002241248o7e9a65b4q6b9c73bc8d3451f6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leonardo Boiko <leoboiko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi!

On Wed, Feb 24, 2010 at 05:48:05PM -0300, Leonardo Boiko wrote:
> I often find myself wanting a quick reference for ANSI color escapes,
> in the same spirit as ascii(7), units(7), or operator(7).  So I went
> ahead and wrote one.  (I'm aware this information is available in
> console_codes(4), but I wanted something simpler and more to the
> point).  I don't know if this is a good idea or just useless bloat,
> and I have no prior experience with troff, but if you guys think it's
> acceptable, feel free to include it.
> 
> The file is available at http://namakajiri.net/code/ansicolors.7 ; if
> you think it's ok, I'll send it to mtk.manpages like the webpage says.

  my first reaction was also that this is redundant to console_codes(4),
but after some thought, I think I do like the idea of having quick
reference just for the basic text attributes.

  Couple of points:

  * I think web references are mostly avoided and not relevant or
necessary here. All of them talk about escape sequences in general,
so they belong to console_codes(4) if anywhere, but in fact the
wikipedia article should be trivially found using a search engine with
this subject and the all-escapes.txt URL looks way too transient.
However, it would make sense to add CONFORMING TO section to the manpage
with the ECMA reference (but probably not the URL).

  * Generally, AUTHOR section is not used for the common manpages.

  * I would move the 'Compatibility notes' subsection to the more
traditional NOTES section, and drop the custom-typeset bulletpoint
list.

  * It is also worth noting that blinking is commonly unimplemented,
with popular alternate implementations being rendering background in
bright color or showing the text in bold.

  * console_codes(4) needs to be adjusted appropriately for this new
manpage at several places, but I think that can be done later.

  * After "There  are several commands to control cursor position, clear
the screen etc.", I would add "See .BR console_codes (4) for detailed
list of all commands." and break the paragraph there.

-- 
				Petr "Pasky" Baudis
A great many people think they are thinking when they are merely
rearranging their prejudices. -- William James
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
