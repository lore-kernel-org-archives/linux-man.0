From: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org
Subject: lseek(2): in defense of "whence"
Date: Sat, 12 Feb 2011 23:35:57 -0500 (GMT+5)
Message-ID: <20110213043557.18773.qmail@kosh.dhis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

According to man2/lseek.2,

  This document's use of whence is incorrect English, but maintained for
  historical reasons.

What is the grammatical objection?

>From WordNet (r) 3.0 (2006) [wn]:
  whence
      adv 1: from what place, source, or cause

Wiktionary:
  [edit] Adverb
  whence (not comparable)
   1. From where; from which place or source.

lseek's second parameter is a distance to be traveled, and the third
parameter chooses the starting point from which that distance is measured.
How is that not a "whence"?

Looking at some man page archives, I found that the accusation of incorrect
English goes back to before 4.4BSD. It survives not just in the
linux-man-pages but also in recent versions of {Net,Open,Free}BSD. The name
"whence" for this parameter goes back at least to V7.

Of all the people who have read this page over the years, am I the only one
wondering... what's this about? Who decided that "whence" was incorrect and
put that note in the man page? Was there ever anything wrong, or do we have
someone's 20-year-old unresearched pet peeve lingering in the man pages?

-- 
Alan Curry
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
