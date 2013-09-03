From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: clock_getres.2: Remove obsolete note on SMP systems
Date: Tue,  3 Sep 2013 11:05:30 +0100
Message-ID: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

About a month and some weeks ago I opened a bug asking if the note on SMP
systems on clock_gettime() manpage was outdated. I explained why I think it
might be outdated and then continue playing with it, until I was even more sure
that it was outdated. Then I found Peter Ziljstra on IRC and he confirmed it is
in fact outdated (no doubts now :-))

The bugzilla entry is here: https://bugzilla.kernel.org/show_bug.cgi?id=60602

So on the next day I uploaded a patch to the bug saying this (the same I'm
sending now) and got no answer. I did ping a couple of times (like 3) but no
answer.

I initially opened the bug on the bugzilla because I didn't have a patch, it was
just a question (I understand that this is the preferred way, from
https://www.kernel.org/doc/man-pages/reporting_bugs.html but I'm not sure if I'm
missunderstanding something). And then, when I had a patch for it, just uploaded
there... seemed natural to me.

So, now I'm sending the patch here because: a) now I have a patch :-D, b) maybe it
has more attention than bugzilla auto-emails ?. But sorry in advance if I should
not send it here if it's already on the bugzilla.

Any comments are, of course, welcome. And if there is something else I should
try/fix, please let me know. I've checked that the page looks fine after the
removal locally, but I might be missing something else :-)


Also, please keep me in Cc: since I'm not subscribed





Thanks a lot,
Rodrigo

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
